class Seed

  def self.start
    p "starting seed generation"
    seed = Seed.new
    seed.reset_data
    seed.generate_book_format_types
    seed.generate_publishers
    seed.generate_authors
  end

  def reset_data
    BookReview.destroy_all
    BookFormat.destroy_all
    Book.destroy_all
    Publisher.destroy_all
    Author.destroy_all
    BookFormatType.destroy_all
    p "deleted books, publishers, and authors..."
  end

  def generate_publishers
    3.times do |i|
      Publisher.create!(title: Faker::Bank.name)
      p "made #{Publisher.last.title}"
    end
  end

  def generate_authors
    p "making authors..."
    3.times do |i|
      author = Author.create!(
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name
              )
      make_book(author)
      p "created \"#{author.books.last.title}\""
    end
  end


  def make_book(author)
    book = author.books.create!(
      title: Faker::Book.title,
      publisher: Publisher.last
    )
    make_book_formats(book)
    make_review(book)
  end

  def generate_book_format_types
    p "making book format types..."
    formats = ["Hardcover","Softcover","Kindle","PDF"]
    4.times do |i|
      BookFormatType.create!(
        name: formats.pop,
        physical: true
      )
      p "made #{BookFormatType.last.name}"
    end
  end

  def make_book_formats(book)
    book.book_format_types.push(BookFormatType.all.shuffle.first)
    p "made #{book.book_format_types.name}"
  end

  def make_review(book)
    p "making reviews..."
    rand(5).times do |i|
      review = BookReview.create!(
        book_id: book.id,
        rating: (1..5).to_a.sample
      )

      "made review for #{book.title} of #{review.rating}"
    end
  end

end

Seed.start
