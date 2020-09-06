# NOTE: not super happy about this one, but it matches the mental model I had formed yesterday. I didn't have time to play around with other ideas.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}

# What I dislike about this solution:
# - as I'm moving with 1 anchor and three pointers, I have two edge cases at the very end
#   - current can be null -> I still need that value
#   - current.next can be null

def delete_duplicates(head)
  return head unless head
  
  dummy_node = ListNode.new('dummy')
  dummy_node.next = head
  
  anchor = dummy_node
  prev = dummy_node
  current = dummy_node.next
  
  loop do
    nextt = current&.next
    
    # I have to keep on going until the current is NULL
    if !current
      anchor.next = current
      break
    # if all three are different, we're good - we move through the list
    elsif (prev.val != current.val) && (current.val != nextt&.val)
      anchor = current
    else
      anchor.next = nextt
    end
    
    prev = current
    current = nextt
  end
  
  dummy_node.next
end