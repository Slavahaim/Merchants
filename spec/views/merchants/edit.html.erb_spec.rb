require 'rails_helper'

RSpec.describe 'merchants/edit', type: :view do
  before do
    @merchant = assign(:merchant, Merchant.create!(
                                    name: 'MyString',
                                    city: 'MyString',
                                    street: 'MyString',
                                    country_code: 'MyString',
                                    extra_info: ''
                                  ))
  end

  it 'renders the edit merchant form' do
    render

    assert_select 'form[action=?][method=?]', merchant_path(@merchant), 'post' do
      assert_select 'input[name=?]', 'merchant[name]'

      assert_select 'input[name=?]', 'merchant[city]'

      assert_select 'input[name=?]', 'merchant[street]'

      assert_select 'input[name=?]', 'merchant[country_code]'

      assert_select 'input[name=?]', 'merchant[extra_info]'
    end
  end
end
