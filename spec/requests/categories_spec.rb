require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:user) { User.create!(email: "example76@gmail.com", 
                            password: '123456',
                            username: "phone33@example",
                            email: "phone@example.com")}

  before :each do
    sign_in user
  end

  describe "POST  /create_category" do
    it "post_create_category" do
      post "/create_category", :params => { :category => {:name => "cat2"} }
      expect(response).to have_http_status(302)
    end
  end
end
