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
      expect(Author.find('F. Scott Fitzgerald')[0]["id"]).to match(UUID_MATCHER)
    end
  end

end
