require 'rails_helper'

RSpec.describe "Sign-ups", type: :system do
  include ActiveJob::TestHelper

  scenario "user successfully signs up" do
    visit root_path
    click_link "新規登録"

    perform_enqueued_jobs do
      expect {
        fill_in "username", with: "First"
        fill_in "Email", with: "test@example.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "test123"
        click_button "Sign up"
      }.to change(User, :count).by(1)

      expect(page).to \
        have_content "Welcome! You have signed up successfully."
      expect(current_path).to eq root_path
    end

  end
end
