require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
    # Test index 
    context "GET #index" do
        # Test that controller can route to index
        it "returns a success response" do
            get :index
            # expect(response.success).to eq(true)
            # Test passes if route returns a success
            expect(response).to be_success
        end
    end

    # Test individual projects
    context "GET #show" do
        # Create a test project
        let!(:project) { Project.create(title: "Test title", description: "Test description") }
        # Test that controller can route to test project
        it "returns a success response" do
            get :show, params: { id: project }
            # Test passes if route returns a success
            expect(response).to be_success
        end
    end
end