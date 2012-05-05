#!/usr/bin/ruby -w

# Binary search to search for elements in a sorted Array
# This software is free and in the public domain.

class Array
  def binary_search( element, left = 0, right = self.length )
    raise ArgumentError.new('Cannot search for nil') if element.nil?
    raise ArgumentError.new("Cannot search for #{element.inspect}" ) unless
      element.respond_to?( :<=> )
    return nil if 0 == self.length

    element_index = nil
    l = left
    r = right
    while element_index.nil? and l <= r do
      midpoint = (l + r) / 2
      case element <=> self[midpoint]
      when 1
        l = midpoint + 1
      when -1
        r = midpoint - 1
      when 0
        element_index = midpoint
      when nil  # No elements in array or elements can't be compared
        raise RuntimeError.new("Cannot compare array element #{self[midpoint].inspect} to #{element.inspect}")
      end
    end
    element_index
  end
end
