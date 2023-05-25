require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new( phone: "+380969809281", 
                         password: '123456',
                         username: "patient_phone33@example",
                         email: "patient_phone@example.com")
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.phone = 'phone123'
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.phone = 'phones'
      expect(subject).to_not be_valid
    end
  end
end
