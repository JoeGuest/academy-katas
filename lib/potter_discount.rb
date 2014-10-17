class HarryPotterDiscount

  BOOKS = { 
    1 => "Book1",
    2 => "Book2",
    3 => "Book3",
    4 => "Book4",
    5 => "Book5"
  }

  DISCOUNT = {}

  def books_in_series
    BOOKS
  end

  def discount_to_apply
    DISCOUNT
  end

  def current_basket(*books_to_add)
    basket = []
    books_to_add.each do |book_to_add|
      if BOOKS.has_key?(book_to_add)
        basket << BOOKS[book_to_add]
      end  
    end
    basket
  end

end