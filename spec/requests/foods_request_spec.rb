require 'rails_helper'

RSpec.describe 'Test index action', type: :request do
  before(:example) do
    @user = User.create!(name: 'Cathy', email: 'cathy@gmail.com', password: 'mightyGod',
                         password_confirmation: 'mightyGod')
    @user.save
    get user_foods_path(@user)
  end
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    expect(response).to render_template('index')
  end
end
