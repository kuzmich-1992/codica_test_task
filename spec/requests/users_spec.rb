require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { User.create!(email: "e33@gmail.com", 
                            password: '123456',
                            username: "patient73@example")}

  before :each do
    sign_in user
  end

  describe "GET /" do
    it "get_root_path" do
      get root_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
