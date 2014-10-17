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

  def current_basket(*book_to_add)
    basket = []
    BOOKS.each do |book_num, title|
      if book_num = book_to_add
        basket << title
      end
    end
    basket
  end

end