require "spec_helper"

describe 'Author' do

  describe '#add' do
    it "adds an author to the database" do
      expect(Author.add('F. Scott Fitzgerald')[0]["id"]).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_name' do
    it "finds an author in the database by name" do
      expect(Author.find_by_name('F. Scott Fitzgerald')[0]["name"]).to eq('F. Scott Fitzgerald')
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
      expect(Book.find_by_title("The Great Gatsby")[0]['title']).to eq("The Great Gatsby")
    end
  end

  describe '#find_by_id' do
    it 'finds a book based on the id' do
      book_id = Book.find_by_title("The Great Gatsby")[0]['id']
      expect(Book.find_by_id(book_id)[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_author' do
    it 'finds a book based on the author' do
      expect(Book.find_by_author("F. Scott Fitzgerald").to_a.any?).to eq(true)
    end
  end

end

describe 'Patreon' do

  describe '#add' do
    it 'creates a new checkout record' do
      book_id = Book.add("The Great Gatsby", 'F. Scott Fitzgerald')[0]['id']
      expect(Patreon.add("John", "Doe", book_id)[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#find' do
    it 'finds a checkout record based on inputted name' do
      book_id = Book.add("The Great Gatsby", 'F. Scott Fitzgerald')[0]['id']
      Patreon.add("Jane", "Eyre", book_id)
      expect(Patreon.find("Jane Eyre")[0]['name']).to eq('Jane Eyre')
    end
  end

end
