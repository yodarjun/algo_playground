require 'pry'

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def add_two_numbers(l1, l2)
  sum = []
  prev_node = nil
  start_node = nil
  carry = false
  while(!l1.nil? || !l2.nil?) do
    val1 = l1.nil? ? 0 : l1.val
    val2 = l2.nil? ? 0 : l2.val
    temp = val1 + val2

    if carry
      temp += 1
      carry = false
    end

    if temp > 9
      temp = temp - 10
      carry = true
    end
    new_node = ListNode.new(temp)
    prev_node.next = new_node unless prev_node.nil?
    sum << temp
    if prev_node.nil?
      start_node = new_node
    end
    prev_node = new_node
    l1 = l1.next unless l1.nil?
    l2 = l2.next unless l2.nil?
  end

  if carry
    new_node = ListNode.new(1)
    prev_node.next = new_node unless prev_node.nil?
    sum << 1
  end

  sum
end

n1 = ListNode.new(8)
n2 = ListNode.new(1)
n2.next = n1

n3 = ListNode.new(0)

node = add_two_numbers(n2, n3)
binding.pry

sum.each { |s| puts s }
