class School
  def initialize
    @students = Hash.new([])
  end

  def add(student, grade)
    if @students.keys.include?(grade)
      @students[grade] << student
    else
      @students[grade] = [student]
    end
    # the conditional could be replaced by @students[grade] += [student]
  end

  def grade(grade)
    @students[grade]
  end

  def to_h
    @students.keys.sort.each_with_object({}) do |grade, sorted_students|
      sorted_students[grade] = @students[grade].sort
    end
  end
end
