# frozen_string_literal: true

# Does stuff
module Enumerable
  # Your code goes here

  # called like enumerable.my_all? { |value| value > 0 }
  def my_all?
    each do |element|
      return false unless yield(element)
    end
    true
  end

  # called like enumerable.my_any?(&:even?)
  def my_any?
    each do |element|
      return true if yield(element)
    end
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
