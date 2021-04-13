require 'rails_helper'

RSpec.describe "User", type: :system do
  let(:user) { FactoryBot.create(:user) }
  scenario "upload image file" do
    sign_in user
    visit root_path
    click_link "マイページ"
    click_link "編集"
    attach_file "プロフィール画像", "#{Rails.root}/spec/files/test.jpg"
    click_button "更新"
    expect(page).to have_content "更新に成功しました。"
  end
end
