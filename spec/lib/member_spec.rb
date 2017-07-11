require 'rails_helper'

describe MembersController,:type => :controller do
  it "get members" do
    get :index
        expect(response).to have_http_status(:success)
  end
end
