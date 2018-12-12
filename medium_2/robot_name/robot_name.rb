class Robot
  @all_names = []
  class << self; attr_accessor :all_names; end
  attr_reader :name

  def initialize
    reset
  end

  def reset
    Robot.all_names.delete(@name) if @name
    new_name = generate_random_name

    if Robot.all_names.include?(new_name)
      reset
    else
      @name = new_name
      Robot.all_names << @name
    end
  end

  private

  def generate_random_name
    ('AA'..'ZZ').to_a.sample + format('%03d', rand(1000))
  end
end
