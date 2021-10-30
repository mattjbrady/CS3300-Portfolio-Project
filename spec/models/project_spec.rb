require "rails_helper"

RSpec.describe Project, type: :model do
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

    context "scopes tests" do
        # Create a set of parameters
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