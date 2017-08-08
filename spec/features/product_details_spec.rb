require 'rails_helper'

RSpec.feature "User navigates from home to a specific product detail (show) page", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
      @product = Product.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        category: @category,
        image: open_asset('apparel1.jpg')
      )

  end

  scenario 'when clicking on product they are navigated to product show page and see product' do
    visit root_path
    click_on 'Details'
    expect(page).to have_css "article.product-detail"
    save_screenshot "specific-product.png"
  end
end