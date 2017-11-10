class Seed

  def self.start
    p "starting seed generation"
    seed = Seed.new
    seed.reset_data
    seed.generate_publishers
    seed.generate_authors
  end

  def reset_data
    Book.destroy_all
    Publisher.destroy_all
    Author.destroy_all
    p "deleted books, publishers, and authors"
  end

  def generate_publishers
    3.times do |i|
      Publisher.create!(title: Faker::Bank.name)
      p "made #{Publisher.last.title}"
    end
  end

  def generate_authors
    p "making Authors"
    3.times do |i|
      author = Author.create!(
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name
              )
      make_book(author)
      p "created #{author.books.last.title}"
    end
  end


  def make_book(author)
    author.books.create!(
      title: Faker::Book.title,
      publisher: Publisher.last
    )
  end
end

Seed.start
