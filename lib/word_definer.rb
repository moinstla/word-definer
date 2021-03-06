class Word
  attr_accessor(:word, :id, :definitions)

  @@words = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@words.length().+(1)
    @definitions = []
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
   @@words = []
 end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(identification.to_i())
        found_word = word
      end
    end
    found_word
  end
end

class Definition

  define_method(:initialize) do |definition|
    @definition = definition
  end

  define_method(:definition) do
    @definition
  end
end
