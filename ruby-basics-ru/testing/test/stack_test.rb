# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN

  def setup
    @stack = Stack.new
  end

  def test_push
    value = 1
    old_size = @stack.size
    @stack.push! value
    assert { @stack.pop! == value }
    assert { old_size == @stack.size }
  end

  def test_pop
    3.times { |value| @stack.push! value }
    assert { @stack.pop! == 2 }
  end

  def test_clear
    3.times { |value| @stack.push! value }
    @stack.clear!
    assert { @stack.empty? }
  end

  def test_empty
    3.times { |value| @stack.push! value }
    refute { @stack.empty? }
    @stack.clear!
    assert { @stack.empty? }
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
