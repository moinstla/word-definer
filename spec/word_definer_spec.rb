require "word_definer"
require "rspec"
require "pry"

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#word") do
    it("accepts a new word") do
      test_word = Word.new({:word => "butterfly"})
      expect(test_word.word()).to(eq("butterfly"))
    end
  end

  describe(".all") do
    it("starts out as empty") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the word") do
      test_word = Word.new({:word => "butterfly"})
      expect(test_word.id()).to(eq(1))
    end
  end

  describe("#definitions") do
    it("initially returns an empty array of definitions for the word") do
      test_word = Word.new({:word => "butterfly"})
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the word to the words array") do
      test_word = Word.new({:word => "butterfly"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.new({:word => "butterfly"}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#add_definition") do
    it("add a definition to the word's definitions array") do
      test_word = Word.new({:word => "butterfly"})
      test_definition = Definition.new("insect with large wings")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new({:word => "butterfly"})
      test_word.save()
      test_word2 = Word.new({:word => "airplane"})
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end

describe(Definition) do
  describe("#definition") do
    it("accepts a new definition of a word") do
      test_definition = Definition.new("insect with large wings")
      expect(test_definition.definition()).to(eq("insect with large wings"))
    end
  end
end
