require "rails_helper"

RSpec.feature "User authentication", type: :feature do
  scenario "As a user I want to be able to create an account" do
    visit "/"

    click_link "Register"
    fill_in "Email", with: "luke@skywalker.com"
    fill_in "Password", with: "may4thbewU"
    fill_in "Password confirmation", with: "may4thbewU"
    click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
end
