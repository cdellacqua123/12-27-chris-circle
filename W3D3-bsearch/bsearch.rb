def bsearch(arr, target)
    return nil if arr.empty?
    
    mid_idx = arr.length / 2
    return mid_idx if arr[mid_idx] == target
    left = arr[0...mid_idx]
    right = arr[mid_idx + 1..-1]
    
    if target < arr[mid_idx]
        bsearch(left, target)
    else
        right_check = bsearch(right, target) 
        return nil if right_check.nil?
        right_check + left.length + 1
    end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil