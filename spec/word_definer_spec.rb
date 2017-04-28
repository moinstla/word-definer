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

  describe("#definitions") do
    it("initially returns an empty array of definitions for the word") do
      test_word = Word.new("butterfly")
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the word to the words array") do
      test_word = Word.new("butterfly")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe("#add_definition") do
    it("add a definition to the word's definitions array") do
      test_word = Word.new("butterfly")
      test_definition = Definition.new("insect with large wings")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end
end

describe(Definition) do
  describe("#description") do
    it("accepts a new definition of a word") do
      test_definition = Definition.new("insect with large wings")
      expect(test_definition.description()).to(eq("insect with large wings"))
    end
  end

  describe(".all") do
    it("starts out as empty") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the word to the words array") do
      test_definition = Definition.new("insect with large wings")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end
end
