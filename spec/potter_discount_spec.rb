require 'potter_discount'

RSpec.describe "Harry Potter discount" do

  it "should have a hash constant that can contain titles" do
    hash = Harry_Potter_Discount.new
    expect( hash.books_in_series ).to eq ({})
  end

  it "should have an array that can be used to store books" do
    basket = Harry_Potter_Discount.new
    expect( basket.current_basket ).to eq ([])
  end

  it "should be able to handle arguments to enter the correct books into the basket" do
    filled_basket = Harry_Potter_Discount.new
    expect( filled_basket.current_basket(1) ).to eq (["Book1"])
  end

  it "should have a price field that resolves to 2 decimal places" do
    price = Harry_Potter_Discount.new
    expect( price.basket_price ).to be_a (Fixnum)
  end

  it "should have a price of 8 euroes for a single book" do
    single_book = Harry_Potter_Discount.new(1)
    expect( single_book.basket_price ).to eq 8
  end

  it "should price two of the same book at 16 euros" do
    two_of_same_book = Harry_Potter_Discount.new(1,1)
    expect( two_of_same_book.basket_price ).to eq 16
  end

  it "should price two different books with a 5% discount" do
    two_different_books = Harry_Potter_Discount.new(1,2)
    expect( two_different_books.basket_price ).to eq 15.2
  end

  it "should price three different books with a 10% discount" do
    three_different_books = Harry_Potter_Discount.new(1,2,3)
    expect( three_different_books.basket_price ).to eq 21.6
  end

  it "should price four different books with a 20% discount" do
    four_different_books = Harry_Potter_Discount.new(1,2,3,4)
    expect( four_different_books.basket_price ).to eq 25.6
  end

  it "should price five different books with a 25% discount" do
    five_different_books = Harry_Potter_Discount.new(1,2,3,4,5)
    expect( five_different_books.basket_price ).to eq 30
  end

  it "should place multiples of the same book into different containers" do
    separate_containers = Harry_Potter_Discount.new(1,1)
    expect( separate_containers.calculate_best_discount).to eq([ [1] , [1] ])
  end

end