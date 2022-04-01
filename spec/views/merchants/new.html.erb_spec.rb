require 'rails_helper'

RSpec.describe 'merchants/new', type: :view do
  before do
    assign(:merchant, Merchant.new(
                        name: 'MyString',
                        city: 'MyString',
                        street: 'MyString',
                        country_code: 'MyString',
                        extra_info: ''
                      ))
  end

  it 'renders new merchant form' do
    render

    assert_select 'form[action=?][method=?]', merchants_path, 'post' do
      assert_select 'input[name=?]', 'merchant[name]'

      assert_select 'input[name=?]', 'merchant[city]'

      assert_select 'input[name=?]', 'merchant[street]'

      assert_select 'input[name=?]', 'merchant[country_code]'

      assert_select 'input[name=?]', 'merchant[extra_info]'
    end
  end
end
