#!/usr/bin/ruby -w

# Test cases for the binary search method

require File.expand_path( File.join( File.dirname(__FILE__), '..', 'binary_search' ) )
require 'test/unit'

class TestBinarySearch < Test::Unit::TestCase
  def assert_search( array_in, search_element, result_expected )
    result_observed = array_in.binary_search(search_element)
    assert_equal( result_expected, result_observed, "Expected #{search_element.inspect} at index #{result_expected.inspect}; observed index #{result_observed.inspect}" )
  end

  def test_search_parameter_present
    test_cases = [
      { :data => (1..100).to_a, :parameter => 8, :result_expected => 7 },
      { :data => [1], :parameter => 1, :result_expected => 0 },
      { :data => [1,2,3], :parameter => 3, :result_expected => 2 },
      { :data => %w{cat parrot dog falcon}.sort, :parameter => 'falcon', :result_expected => 2 }
      #{ :data => , :parameter => , :result_expected => }
    ].shuffle!

    test_cases.each do |test_case|
      assert_search( test_case[:data], test_case[:parameter], test_case[:result_expected])
    end
  end

  def test_search_parameter_missing
    test_cases = [
      { :data => [], :parameter => 'ruby', :result_expected => nil },
      { :data => %w{tomato celery radish arugula}.sort, :parameter => 'apple', :result_expected => nil },
      #{ :data => , :parameter => , :result_expected => }
    ].shuffle!

    test_cases.each do |test_case|
      assert_search( test_case[:data], test_case[:parameter], test_case[:result_expected])
    end
  end

  def test_search_for_nil
    test_cases = [
      { :data => [], :parameter => nil, :result_expected => nil }
      #{ :data => , :parameter => , :result_expected => }
    ].shuffle!

    test_cases.each do |test_case|
      assert_raise(ArgumentError){ test_case[:data].binary_search(test_case[:parameter]) }
    end
  end

  def test_search_parameter_does_not_define_comparison_operator
    test_cases = [
      { :data => [1,2,3], :parameter => true, :result_expected => nil }
      #{ :data => , :parameter => , :result_expected => }
    ].shuffle!

    test_cases.each do |test_case|
      assert_raise(ArgumentError){ test_case[:data].binary_search(test_case[:parameter]) }
    end
  end

  def test_search_for_incomparable_types
    test_cases = [
      { :data => [1,2,3], :parameter => '1', :result_expected => nil }
      #{ :data => , :parameter => , :result_expected => }
    ].shuffle!

    test_cases.each do |test_case|
      assert_raise(RuntimeError){ test_case[:data].binary_search(test_case[:parameter]) }
    end
  end
end
