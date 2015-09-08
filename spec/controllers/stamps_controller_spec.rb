require 'rails_helper'

RSpec.describe StampsController, type: :controller do
  it "responds successfully" do
    get :index
    expect(response.status).to eq(200)
  end
end
