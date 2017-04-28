require "word_definer"
require "rspec"
require "pry"

describe(Word) do
  describe("#name") do
    it("accepts a new word") do
      test_word = Word.new("butterfly")
      expect(test_word.name()).to(eq("butterfly"))
    end
  end

  describe(".all") do
    it("starts out as empty") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the word") do
      test_word = Word.new("butterfly")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("saves the word to the words array") do
      test_word = Word.new("butterfly")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end
end
