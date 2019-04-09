input = File.read('./input.txt')

def parse(input)
  input.split("\n")
end

def find_matching_boxes(input)
  boxes = parse(input)

  loop do
    current_box = boxes.shift

    boxes.each do |compared_box|
      next if compared_box.length != current_box.length
      count = 0

      compared_box.chars.each_with_index do |char, index|
        count += 1 if current_box[index] != char
        break if count > 1
      end

      return [current_box, compared_box] if count == 1
    end
  end
end

def return_matching_chars(box1, box2)
  box1.chars.select.with_index { |char, index| char == box2[index] }.join
end

box1, box2 = find_matching_boxes(input)
p return_matching_chars(box1, box2)
