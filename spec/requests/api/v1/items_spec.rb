require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "获取账目" do
    it "账目分页" do
      11.times do
        Item.create amount: 100
      end
      get '/api/v1/items'
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(Item.count).to eq 11
      expect(json['resources'].size).to eq 10
      get "/api/v1/items?page=2"
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 1  
    end

    it "按时间筛选" do
      item1 = Item.create amount: 100, created_at: '2018-01-01'
      item2 = Item.create amount: 100, created_at: '2018-01-01'
      item3 = Item.create amount: 100, created_at: '2019-01-01'
      get '/api/v1/items?created_after=2018-01-01&created_before=2018-01-03'
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 2
      expect(json['resources'][0]['id']).to eq item1.id
      expect(json['resources'][1]['id']).to eq item2.id
    end
    it "按时间筛选(边界情况)" do
      # 明确写上时区
      # item1 = Item.create amount: 100, created_at: Time.new(2018, 1, 1, 0, 0, 0, 'Z')
      item1 = Item.create amount: 100, created_at: '2018-01-01'
      get '/api/v1/items?created_after=2018-01-01&created_before=2018-01-03'
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 1
      expect(json['resources'][0]['id']).to eq item1.id
    end

    it "按时间筛选(边界情况-只有开始时间)" do
      item1 = Item.create amount: 100, created_at: '2018-01-01'
      item2 = Item.create amount: 100, created_at: '2017-01-01'
      get '/api/v1/items?created_after=2018-01-01'
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 1
      expect(json['resources'][0]['id']).to eq item1.id
    end

    it "按时间筛选(边界情况-只有结束时间)" do
      item1 = Item.create amount: 100, created_at: '2018-01-01'
      item2 = Item.create amount: 100, created_at: '2019-01-01'
      get '/api/v1/items?created_before=2018-01-02'
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 1
      expect(json['resources'][0]['id']).to eq item1.id
    end
  end

  # describe "create /items" do
  #   it '创建 items' do
  #     expect {
  #       post '/api/v1/items', params: { amount: 99 }
  #     }.to change  {Item.count}.by(1)
  #   end
  # end
  
end
