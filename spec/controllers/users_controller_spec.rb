require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it "responds successfully" do
    get :index
    expect(response.status).to eq(200)
  end
end
