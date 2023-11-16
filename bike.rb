# Bike

class Bike
  STANDARD_WEIGHT = 200 # lbs

  attr_accessor :id, :color, :price, :weight, :rented

  def initialize(id, color, price, weight = STANDARD_WEIGHT, rented = false)
    @id = id
    @color = color
    @price = price
    @weight = weight
    @rented = rented
    @cargo = Cargo.new
  end

  def rent!
    self.rented = true
  end

  def add_cargo(item)
    @cargo.add_item(item)
  end

  def remove_cargo(item)
    @cargo.remove_item(item)
  end

  def pannier_capacity
    @cargo.capacity
  end

  def pannier_remaining_capacity
    @cargo.remaining_capacity
  end
end

class Cargo
  MAX_CARGO_ITEMS = 10

  attr_accessor :contents

  def initialize
    @contents = []
  end

  def add_item(item)
    self.contents << item
  end

  def remove_item(item)
    self.contents.delete(item)
  end

  def capacity
    MAX_CARGO_ITEMS
  end

  def remaining_capacity
    MAX_CARGO_ITEMS - self.contents.size
  end
end