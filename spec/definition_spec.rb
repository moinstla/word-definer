require "word_definer"
require "rspec"
require "pry"

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
