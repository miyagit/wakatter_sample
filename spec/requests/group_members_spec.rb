require 'rails_helper'

RSpec.describe "GroupMembers", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/group_members/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/group_members/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/group_members/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
