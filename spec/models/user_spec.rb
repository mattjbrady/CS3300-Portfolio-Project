require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    it "ensures user has a password" do
      # Create user without password value
      user = User.new(email: "testuser@testemail.com")

      # Should not be able to create a user without a password
      expect(user.valid?).to eq(false)
    end
  end

  # Test that the multiple users can exist
  context "scopes tests" do
    # Create three users
    before(:each) do
        User.create(email: "testuser1@testemail.com", password: "abcdef")
        User.create(email: "testuser2@testemail.com", password: "ghijkl")
        User.create(email: "testuser3@testemail.com", password: "mnopqr")
    end
    
    # All three projects should exist
    it "should return all users" do
        expect(User.count).to eq(3)
    end
end
end
