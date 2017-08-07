require "rails_helper"

RSpec.describe Product, type: :model do

  subject do
    Product.create({
      name: 'boxers',
      price: 3.00,
      quantity: 1
    })
  end

  before do
    Review.create({
      product: subject,
      rating: 2,
      description: 'comfy'
    })
  end

  it 'is a product' do
    expect(subject).to be_a(Product)
  end

  describe '#average_review' do
    context 'given the only review available is a 2' do
      it 'should be 2' do
        expect(subject.average_review).to eq(2)
      end
    end

    context 'given there is a 4 and 2 star review' do
      before do
        Review.create({
          product: subject,
          rating: 4,
          description: 'comfy'
        })
      end

      it 'should be 3' do
        expect(subject.average_review).to eq(3)
      end
    end
  end

  describe '#rating' do
    context 'given the only review available is a 2' do
      it 'should return a rating that is reasonably formatted' do
        expect(subject.rating).to eq(
          "Rated 2/5 from 1 reviews"
        )
      end
    end
  end
end