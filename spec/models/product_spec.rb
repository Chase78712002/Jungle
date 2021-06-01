require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do

    before do
      @cat1 = Category.new({name: 'Batman'})
      @cat1.save
    end

    context "All fields present" do
      it 'saves successfully' do
        product = Product.new(
          name: 'basketball',
          price: 80,
          quantity: 1,
          category: @cat1
        )

        expect(product.save).to be_truthy
      end
    end

    context "Name missing" do
      it 'should returns error' do
        product = Product.new(
          name: nil,
          price: 80,
          quantity: 1,
          category: @cat1
        )
        product.save
        expect(product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context "Price missing" do
      it 'should returns error' do
        product = Product.new(
          name: "Basketball",
          price: nil,
          quantity: 1,
          category: @cat1
        )
        product.save
        expect(product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context "Quantity missing" do
      it 'should returns error' do
        product = Product.new(
          name: "Basketball",
          price: 80,
          quantity: nil,
          category: @cat1
        )
        product.save
        expect(product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context "Category missing" do
      it 'should returns error' do
        product = Product.new(
          name: "Basketball",
          price: 80,
          quantity: 1,
          category: nil
        )
        product.save
        expect(product.errors.full_messages).to include("Category can't be blank")
      end
    end
    
  end

end
