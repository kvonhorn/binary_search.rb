binary_search.rb
================

Binary search mixin for Ruby Arrays.

## Example

  require 'binary_search'
  my_array = [6,2,1,8,4].sort
  search_element = 2
  index = my_array.binary_search(search_element)
  if index.nil?
    puts "Could not find #{search_element} in #{my_array.inspect}"
  else
    puts "Found #{search_element} in #{my_array.inspect} at index #{index}"
  end

## License

This software is free and in the public domain.
