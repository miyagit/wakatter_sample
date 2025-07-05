require 'rails_helper'

RSpec.describe "Groups::Posts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/groups/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/groups/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/groups/posts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/groups/posts/create"
      expect(response).to have_http_status(:success)
    end
  end

end
