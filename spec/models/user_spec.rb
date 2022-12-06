require 'rails_helper'

RSpec.describe User, type: :model do
  it '有 emial' do
    user = User.create email: '1@qq.com'
    expect(user.email).to eq '1@qq.com'  
  end
end
