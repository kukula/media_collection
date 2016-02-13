require "rails_helper"

RSpec.feature "User authentication", type: :feature do
  given!(:user) { FactoryGirl.create :user, email: "obiwan@kenobi.com" }

  scenario "As a user I want to be able to create an account" do
    visit "/"

    click_link "Register"
    fill_in "Email", with: "luke@skywalker.com"
    fill_in "Password", with: "may4thbewU"
    fill_in "Password confirmation", with: "may4thbewU"
    click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
  end

  scenario "As a user I want to be able to sign in" do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: "obiwan@kenobi.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_text("Signed in successfully.")
  end

  scenario "As a user I want to be able to sign out" do
    login_as(user)
    visit "/"

    expect(page).to have_text("Signed in as obiwan@kenobi.com")
    click_link "Sign out"

    expect(page).to have_text("Signed out successfully.")
  end
end
