# NOTE: I adjusted the variable names and cleaned up the logic flow after looking at some proposed solutions, but the logic is pretty much as we discussed yesterday.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}

def reverse_between(head, m, n)
  return head unless head
  
  prev = nil
  current = head
  current_idx = 1
  
  while current_idx < m do # we move through the list
    prev = current
    current = current.next
    current_idx += 1
  end
  
  tail = current # this will need to be relinked to the end
  con = prev # we'll reattach the reversed list to this node
  
  while current_idx <= n do
    nextt = current.next
    current.next = prev
    prev = current
    current = nextt
    current_idx += 1
  end
  
  # we relink to the 'dangling head'
  con ? con.next = prev : head = prev # in case the list was reversed from the start
  
  # the last element of the reversed section is relinked to the rest of the list
  tail.next = current
  
  head
end