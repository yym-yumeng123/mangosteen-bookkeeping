require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "index /items" do
    it "works! (now write some real specs)" do
      11.times do
        Item.create amount: 100
      end
      get '/api/v1/items'
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(Item.count).to eq 11
      expect(json['resources'].size).to eq 10  
    end
  end

  describe "create /items" do
    it '创建 items' do
      expect {
        post '/api/v1/items', params: { amount: 99 }
      }.to change  {Item.count}.by(1)
    end
  end
  
end
