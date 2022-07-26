require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Validation Codes" do
  post "/api/v1/validation_codes" do
    parameter :email, '邮箱', required: true
    let(:email) { '1@qq.com' }
    example "请求发送验证码" do
      do_request
      expect(status).to eq 200
    end
  end
end
