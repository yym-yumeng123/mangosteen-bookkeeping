require 'rails_helper'

RSpec.describe "ValidationCodes", type: :request do
  describe "会话" do
    it "登录 (创建会话)" do
      User.create email: '1@qq.com'
      post "/api/v1/session", params: { email: '1@qq.com', code: '123456' }
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['jwt']).to be_a(String)
    end

    it "首次登录" do 
      post '/api/v1/session', params: {email: 'fangyinghang@foxmail.com', code: '123456'}
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json['jwt']).to be_a(String)
    end

    # it '发送太频繁会返回 429' do
    #   post "/api/v1/validation_codes", params: { email: '1@qq.com' }
    #   expect(response).to have_http_status(200)
    #   post "/api/v1/validation_codes", params: { email: '1@qq.com' }
    #   expect(response).to have_http_status(429)
    # end
  end
end
