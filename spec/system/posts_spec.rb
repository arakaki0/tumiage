require 'rails_helper'



RSpec.describe "Posts", type: :system do
  let(:user){ FactoryBot.create(:user) }
  let(:user2){ FactoryBot.create(:user,point: 2) }
  # ユーザーは新しい積み上げを記録する
  scenario "user creates a new post" do

    sign_in user

    visit root_path

    expect {
      click_link "新規投稿"
      fill_in "今日の積み上げ内容", with: "Test Project"
      click_button "投稿"

      expect(page).to have_content "積み上げを記録しました。"
      expect(page).to have_content "Test Project"
    }.to change(user.posts, :count).by(1)

    visit user_path(user.id)
    expect(page).to have_content "積上済"
  end

  # point=2のユーザーは新しい積み上げを記録できない
  scenario "user with 2point can't create a new post" do
    post = FactoryBot.create(:post, user_id: user.id)

    sign_in user2

    visit root_path

    expect {
      click_link "新規投稿"
      expect(page).to have_content "積み上げを記録するにはあと1回、他の積み上げをスゴイね！してください。"
      fill_in "今日の積み上げ内容", with: "Test Project"
      click_button "投稿"
      expect(page).to have_current_path posts_path
      expect(page).to have_content "積み上げを記録するにはあと1回他の人をスゴイね！してください。"
    }.to_not change(user.posts, :count)

      # スゴイね！をした後、point=3になると新しい積み上げを記録できる
      visit posts_path
      click_link "スゴイね！をする"
      expect {
        click_link "新規投稿"
        fill_in "今日の積み上げ内容", with: "Test Project"
        click_button "投稿"

        expect(page).to have_content "積み上げを記録しました。"
        expect(page).to have_content "Test Project"
      }.to change(user2.posts, :count).by(1)

      visit user_path(user2.id)
      expect(page).to have_content "積上済"
  end


  # ユーザーは積み上げ内容を編集する
  scenario "user edits the post" do
    post = FactoryBot.create(:post, user_id: user.id)

    sign_in user

    visit root_path

    click_link "投稿一覧"
    click_link "test content"
    click_link "編集画面へ"
    fill_in "積み上げた内容", with: "test content edit"
    click_button "投稿"

    expect(page).to have_content "更新に成功しました。"
    expect(page).to have_content "test content edit"
  end

  # 他のユーザーは積み上げ内容を編集できない
  scenario "other user can't edit the post" do

    post2 = FactoryBot.create(:post, user_id: user2.id)

    sign_in user

    visit root_path

    click_link "投稿一覧"
    click_link "test content"
    expect(page).to_not have_link "編集画面へ"

  end
end
