require 'rails_helper'

RSpec.describe 'merchants/show', type: :view do
  before do
    @merchant = assign(:merchant, Merchant.create!(
                                    name: 'Name',
                                    city: 'City',
                                    street: 'Street',
                                    country_code: 'Country Code',
                                    extra_info: ''
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(//)
  end
end
