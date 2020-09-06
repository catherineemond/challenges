# https://leetcode.com/problems/search-in-a-binary-search-tree/

def search_bst(root, val)
  return root if !root || root.val == val
  
  if root.val > val
    search_bst(root.left, val)
  else
    search_bst(root.right, val)
  end
end