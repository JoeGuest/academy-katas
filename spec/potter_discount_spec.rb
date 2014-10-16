require 'potter_discount'

RSpec.describe "Harry Potter discount" do

  it "should have a hash constant that can contain titles" do
    hash = Harry_Potter_Discount.new
    expect( hash.books_in_series ).to eq({})
  end
end