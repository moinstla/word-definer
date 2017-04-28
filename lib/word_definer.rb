class Word
  @@words = []

  define_method(:initialize) do |name|
    @name = name
    @id = @@words.length().+(1)
    @definitions = []
  end

  define_method(:name) do
    @name
  end

  define_method(:definitions) do
    @definitions
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
end


class Definition
  @@descriptions = []

  define_method(:initialize) do |description|
    @description = description
  end

  define_method(:description) do
    @description
  end

  define_singleton_method(:all) do
    @@descriptions
  end

  define_method(:save) do
    @@descriptions.push(self)
  end
end
