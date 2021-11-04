require "rails_helper"

# Unit tests for Model portion of Project MVC
RSpec.describe Project, type: :model do
    # Test the input validation at the model layer for instancing a new entry to the Model
    context "validations tests" do
        it "ensures the title is present" do
            project = Project.new(description: "Content of the description")
            # Test should fail if projects can be created without title
            expect(project.valid?).to eq(false)
        end

        it "should be absle to save project" do
            project = Project.new(title: "Title", description: "Some description content goes here")
        end
    end

    # Test that the Model can hold multiple test projects
    context "scopes tests" do
        # Create a set of parameters for a test project
        let(:params) { { title: "Title", description: "some description" } }
        # Create three projects
        before(:each) do
            Project.create(params)
            Project.create(params)
            Project.create(params)
        end
        
        # All three projects should exist
        it "should return all projects" do
            expect(Project.count).to eq(3)
        end
    end
end