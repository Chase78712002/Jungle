require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true  do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details" do

    # ACT
    visit root_path
    click_link('Details', match: :first)
    # DEBUG
    expect(page).to have_selector '.products-show'
    puts page.html

    # Verify
    save_screenshot 'test_product_details.png'
    
    
    

  end

end
