require 'potter_discount'

RSpec.describe "Harry Potter discount" do
  it "should store the books in a hash to reference" do
    hash = Harry_Potter_Discount.new
    expect( hash.class ).to eq Hash
  end
end