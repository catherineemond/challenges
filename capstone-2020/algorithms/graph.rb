class Person
  attr_accessor :name, :friends, :visited

  def initialize(name)
    @name = name
    @visited = false
    @friends = []
  end

  def add_friend(friend)
    @friends << friend
  end

  def display_network
    to_reset = [self] # to reset visit status to false at the end
    queue = [self] # we start with the current vertex
    self.visited = true

    while queue.any? do
      current_vertex = queue.shift
      p current_vertex.name

      current_vertex.friends.each do |friend|
        if !friend.visited
          to_reset << friend
          queue << friend
          friend.visited = true
        end
      end
    end

    to_reset.each { |node| node.visited = false }
  end
end

alice = Person.new('Alice')
bob = Person.new('Bob')
candy = Person.new('Candy')
derek = Person.new('Derek')
fred = Person.new('Fred')
gina = Person.new('Gina')

alice.add_friend(bob)
alice.add_friend(candy)
alice.add_friend(derek)

bob.add_friend(fred)
derek.add_friend(gina)

alice.display_network