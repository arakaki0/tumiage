require 'rails_helper'

RSpec.describe "Sign in", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  scenario "user signs in" do
    visit root_path
    click_link "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
  end
end
