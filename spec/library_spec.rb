require "spec_helper"

describe 'User' do

  describe '#add' do
    it "adds a new user to the database" do
      expect(User.add('bruce')[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_id' do
    it "adds a new user to the database" do

      id = User.find_by_name('Kai')[0]['id']
      expect(User.find_by_id(id)[0]['name']).to eq('kai')
    end
  end

  describe '#find_by_name' do
    it "adds a new user to the database" do
      expect(User.find_by_name('Kai')[0]['id']).to match(UUID_MATCHER)
    end
  end

end

describe 'Author' do

  describe '#add' do
    it "adds an author to the database" do
      expect(Author.add('F. Scott Fitzgerald')[0]["id"]).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_name' do
    it "finds an author in the database by name" do
      expect(Author.find_by_name('F. Scott Fitzgerald')[0]["name"]).to eq('f. scott fitzgerald')
    end
  end

end

describe 'Book' do

  describe '#all' do
    it 'returns all book objects in the database' do
      expect(Book.add("The Great Gatsby", 'F. Scott Fitzgerald')[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#add' do
    it 'adds a new book to the database' do
      expect(Book.add("The Great Gatsby", 'F. Scott Fitzgerald')[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_title' do
    it 'finds a book based on the title' do
      expect(Book.find_by_title("the Great Gatsby")[0]['title']).to eq("the great gatsby")
    end
  end

  describe '#find_by_id' do
    it 'finds a book based on the id' do
      book_id = Book.find_by_title("the Great Gatsby")[0]['id']
      expect(Book.find_by_id(book_id)[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_author' do
    it 'finds a book based on the author' do
      expect(Book.find_by_author("F. Scott Fitzgerald").to_a.any?).to eq(true)
    end
  end

end

describe 'Checkout' do

  describe '#add' do
    it 'creates a new checkout record' do
      book_id = Book.add("the Great Gatsby", 'F. Scott Fitzgerald')[0]['id']
      User.add('Paul')
      user_id = User.find_by_name('Paul')[0]['id']
      expect(Checkout.add(user_id, book_id)[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#check_duplicate' do
    it 'check database for duplicate checkout' do
      book_id = Book.add("the Great Gatsby", 'f. scott fitzgerald')[0]['id']

      User.add('Paul')
      user_id = User.find_by_name('Paul')[0]['id']
      Checkout.add(user_id, book_id)
      expect(Checkout.check_duplicate(user_id, book_id)[0]['id'].any?).to eq(true)
    end
  end

end
