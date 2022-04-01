require 'rails_helper'

RSpec.describe 'merchants/index', type: :view do
  before do
    assign(:merchants, [
             Merchant.create!(
               name: 'Name',
               city: 'City',
               street: 'Street',
               country_code: 'Country Code',
               extra_info: ''
             ),
             Merchant.create!(
               name: 'Name',
               city: 'City',
               street: 'Street',
               country_code: 'Country Code',
               extra_info: ''
             )
           ])
  end

  it 'renders a list of merchants' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'City'.to_s, count: 2
    assert_select 'tr>td', text: 'Street'.to_s, count: 2
    assert_select 'tr>td', text: 'Country Code'.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
  end
end
