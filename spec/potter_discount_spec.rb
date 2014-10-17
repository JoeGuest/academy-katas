require 'potter_discount'

RSpec.describe "The Harry Potter discount should" do

  context "be set out to" do
    it "have a hash constant that can contain titles" do
      titles = HarryPotterDiscount.new
      expect( titles.books_in_series.class ).to be Hash
    end

    it "have a hash constant understanding the discount to be applied" do
      discount = HarryPotterDiscount.new
      expect( discount.discount_to_apply.class ).to be Hash
    end

    it "have an array that can be used to store books in basket" do
      basket = HarryPotterDiscount.new
      expect( basket.current_basket.class ).to be Array
    end

    it "handle arguments to enter the correct books into the basket" do
      filled_basket = HarryPotterDiscount.new
      expect( filled_basket.current_basket(1) ).to eq (["Book1"] )
    end

    it "have a price field that resolves to 2 decimal places" do
      price = HarryPotterDiscount.new
      expect( price.basket_price(6.65) ).to eq 2 
    end
  end


  context "apply the correct price for different books for" do
    it "a single book at 8 euros" do
      single_book = HarryPotterDiscount.new(1)
      expect( single_book.basket_price ).to eq 8
    end

    it "two of the same book at 16 euros" do
      two_of_same_book = HarryPotterDiscount.new(1,1)
      expect( two_of_same_book.basket_price ).to eq 16
    end

    it "two different books with a 5% discount" do
      two_different_books = HarryPotterDiscount.new(1,2)
      expect( two_different_books.basket_price ).to eq 15.2
    end

    it "three different books with a 10% discount" do
      three_different_books = HarryPotterDiscount.new(1,2,3)
      expect( three_different_books.basket_price ).to eq 21.6
    end

    it "four different books with a 20% discount" do
      four_different_books = HarryPotterDiscount.new(1,2,3,4)
      expect( four_different_books.basket_price ).to eq 25.6
    end

    it "five different books with a 25% discount" do
      five_different_books = HarryPotterDiscount.new(1,2,3,4,5)
      expect( five_different_books.basket_price ).to eq 30
    end
  end

  context "attempt to find the best discount by" do
    it "placing multiples of the same book into different containers" do
      separate_containers = HarryPotterDiscount.new(1,1)
      expect( separate_containers.filtered_books_multiples ).to eq([ [1] , [1] ])
    end

    it "placing different mutiples of the same books into different containers" do
      separate_containers = HarryPotterDiscount.new(1,1,2,2)
      expect( separate_containers.filtered_books_multiples ).to eq([ [1,2] [1,2] ])
    end

    it "placing books with no multiples into different containers" do
      separate_containers = HarryPotterDiscount.new(1,1,2,2,3,4)
      expect( separate_containers.filtered_books_remainder ).to eq([ [3], [4] ])
    end

    it "finding the length of the longest arrays" do
      length_of_containers_without_single_books = HarryPotterDiscount.new(1,1,2,2,3,4)
      expect( length_of_containers_without_single_books.length_of_multiples ).to eq 2
    end

    it "counting the amount of single value containers" do
      remainder_books = HarryPotterDiscount.new(1,1,2,2,3,4)
      expect( remainder_books.amount_of_single_books ).to eq 2
    end
  end

  context "calculate the best discount" do
  end

end