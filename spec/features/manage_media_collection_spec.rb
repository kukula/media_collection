require "rails_helper"

RSpec.feature "As a user I want to be able to manage my media collection", type: :feature do
  given!(:user) { FactoryGirl.create :user, email: "obiwan@kenobi.com" }

  scenario "Create media item" do
    login_as(user)
    visit "/"

    fill_in "Link", with: "https://www.youtube.com/watch?v=p_tYQRP4QWM"
    fill_in "Title", with: "Do. Or do not. There is no try. Yoda (Star wars)"
    click_button "Create"

    expect(page).to have_text("Media item was created successfully.")
  end
end
