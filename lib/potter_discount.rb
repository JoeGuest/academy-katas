=begin
class Library

  @book = {
    "Book1" => 8,
    "Book2" => 8,
    "Book3" => 8,
    "Book4" => 8,
    "Book5" => 8
  }

  def self.find(id)
    @books[id]
  end

end


class Book

  attr_reader :id, :name, :price

  def initialize(id, name, price)
    @id = id
    ...
  end

end
=end

class BookDetails

  TITLE_AND_PRICE = { 
    "Book1" => 8,
    "Book2" => 8,
    "Book3" => 8,
    "Book4" => 8,
    "Book5" => 8
  }

  def initialize(number_of_book)
    @book = number_of_book
  end

  def book_title
    TITLE_AND_PRICE.keys[@book - 1]
  end

  def book_price
    TITLE_AND_PRICE.values[@book - 1]
  end

end

class HarryPotterDiscount

  BOOKS = { 
    1 => BookDetails.new(1),
    2 => BookDetails.new(2),
    3 => BookDetails.new(3),
    4 => BookDetails.new(4),
    5 => BookDetails.new(5)
  }

  DISCOUNT = {
    1 => 0,
    2 => 5,
    3 => 10,
    4 => 20,
    5 => 25
  }

  def initialize(*books_to_add)
    @basket = []
    @price = 0
    @books = books_to_add
  end

  def books_in_series
    BOOKS
  end

  def discount_to_apply
    DISCOUNT
  end

  def current_basket(*add_to_basket)
    add_to_basket.each do |book_to_add|
      @basket << BOOKS.values[book_to_add - 1].book_title
    end
    @basket
  end

  def basket_price
    @books.each do |book_to_add|
      @price += BOOKS.values[book_to_add - 1].book_price
    end
    @price
  end

  def basket_price_check(total_price)
    num = 0
    while(total_price != total_price.to_i)
        num += 1
        total_price *= 10
    end
    num
  end

end