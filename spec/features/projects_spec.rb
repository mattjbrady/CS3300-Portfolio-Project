require 'rails_helper'

# Feature tests for the application site's front-end behavior for project pages
RSpec.feature "Projects", type: :feature do
  # Testing project creation
  context "Create new project" do
        
    # For each test for this feature, create a test project to run
    before(:each) do
      # Log in
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      # Go to new project
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    # Test that a created project displays a success message and navigates
    # to new project page
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    # Tests that a failed project displays an error message on page
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  # Testing the ability to edit an existing project
  context "Update project" do
    # For each test of this feature, create a test project, access its editing page
    let(:project) { Project.create(title: "Test title", description: "Test content") }

    before(:each) do
      visit edit_project_path(project)
    end

    # Test a successful valid change to a project's description
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    # Test an invalid empty description change
    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  # Test ability to delete project
  context "Remove existing project" do
    # Create a project
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    # Test that the project can be removed and confirms a succesful deletion, and that
    # there are no projects in the Model
    scenario "remove project" do
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end