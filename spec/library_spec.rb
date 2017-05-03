require "library"
require "rspec"
require "pry"
require "spec_helper"
require "pg"

describe 'Author' do

  describe '#add' do
    it "adds an author to the database" do
      expect(Author.add('F. Scott Fitzgerald')[0]["id"]).to match(UUID_MATCHER)
    end
  end

  describe '#find' do
    it "finds an author in the database by name" do
      expect(Author.find('F. Scott Fitzgerald')[0]["name"]).to eq('F. Scott Fitzgerald')
    end
  end

end


describe 'Book' do

  describe '#add' do
    it 'adds a new book to the database' do
      expect(Book.add("The Great Gatsby", 'F. Scott Fitzgerald')[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#find' do
    it 'finds a book based on the title' do
      expect(Book.find("The Great Gatsby")[0]['title']).to eq("The Great Gatsby")
    end
  end

end
