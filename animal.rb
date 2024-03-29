require './remover'
require './foods'

class Animal
  attr_reader :owner, :visits, :id, :type, :number_of_legs

  def initialize(type, number_of_legs, name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @number_of_legs = number_of_legs
    @type = type
    @liked_food = NoFood.new
    @visits = []
  end

  attr_accessor :name

  def remove_leg
    remover = Remover.new
    @number_of_legs = remover.decrease(@number_of_legs)
  end

  def speak
    'grrrr'
  end

  def likes_food?(food)
    @liked_food.liked?(food)
  end

  def owner=(owner)
    @owner = owner
    owner.animals.push(self) unless owner.animals.include?(self)
  end
end
