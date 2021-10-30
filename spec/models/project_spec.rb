require "rails_helper"

RSpec.describe Project, type: :model do
    context "validations tests" do
        it "ensures the title is present" do
            project = Project.new(description: "Content of the description")
            expect(project.valid?).to eq(false)
        end

        it "should be absle to save project" do
            project = Project.new(title: "Title", description: "Some description content goes here")
        end
    end

    context "scopes tests" do
    
    end
end