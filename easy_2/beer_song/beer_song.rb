class BeerSong
  def lyrics
    verses(99, 0)
  end

  def verses(first, last)
    first.downto(last).map { |num| verse(num) }.join("\n")
  end

  def verse(num)
    verse = "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"

    verse.gsub(/(\A|\s)(1 bottles)/, '\11 bottle')
         .gsub(/(\A|\s)(0 bottles)/, '\1no more bottles')
         .gsub(/\Ano/, 'No')
         .gsub(/(Take one)(.*)(no more)/, 'Take it\2\3')
         .gsub(/Take one down and pass it around, -1 bottles/, 'Go to the store and buy some more, 99 bottles')
  end
end
