require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "the visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end
