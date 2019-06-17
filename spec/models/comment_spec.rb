require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user){create(:user)}
  let!(:coworkingspace){create(:coworkingspace)}
 
  subject{
     build(:comment, message: "comment message", user_id: user.id, coworkingspace_id: coworkingspace.id)
  }

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

 it "should not be valid without message" do
       subject.message = nil
       expect(subject).to_not be_valid
    end
    
    it { should validate_presence_of(:message) }
  end

    context "association" do
    it { should belong_to(:user) }
  end

    context "associationCSpace" do
    it { should belong_to(:coworkingspace) }
  end


end
