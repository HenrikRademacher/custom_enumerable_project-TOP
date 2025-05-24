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

  # called like enumerable.my_count { |value| value > 5 } or blockless
  def my_count
    return size unless block_given?

    i = 0
    each do |element|
      i += 1 if yield(element)
    end
    i
  end

  # called like:
  # enumerable.my_each_with_index do |element, index|
  #  my_each_with_index_results << [element * 2, index * 2]
  # end
  def my_each_with_index
    i = 0
    each do |element|
      yield(element, i)
      i += 1
    end
  end

  def my_inject(initial_value)
    current_total = initial_value
    each do |element|
      current_total = yield(current_total, element)
    end
    current_total
  end

  def my_map
    new_array = []
    each do |element|
      new_array << yield(element)
    end
    new_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  # called like:
  # array.my_each do |element|
  #   my_each_results << element * 2
  # end
  def my_each(&block)
    each(&block)
  end
end
