class Phrase
  def initialize(sentence)
    @sentence = sentence
    @counts = {}
  end

  def word_count
    remove_edge_case
    split_by_space_or_punctuation
    clean_up_array
    clean_up_words
    create_word_hash

    @counts
  end

  def remove_edge_case
    edge_case = @sentence.match(/\w+'\w+/).to_s
    p edge_case
    if edge_case!= ''
      @counts[edge_case] = @sentence.scan(/\w+'\w+/).count
      @sentence.gsub!(edge_case, '')
    end
  end

  def split_by_space_or_punctuation
    @words = @sentence.split(/[ ,]/)
  end

  def clean_up_array
    @words.select! { |word| word.match(/\w+/)}
  end

  def clean_up_words
    @words.map! do |word|
      word.chars.select do |char|
        char.match(/[A-Za-z0-9]/i)
      end.join('')
    end
  end

  def create_word_hash
    @words.each do |word|
      if @counts[word] == nil
        @counts[word] = 1
      else
        @counts[word] += 1
      end
    end
  end
end
