class Array

  def merge_sort(&prc)
    return self if self.length == 1

    prc ||= Proc.new {|ele1, ele2| ele1 <=> ele2}

    mid_idx = self.length / 2
    left_arr = self[0...mid_idx]
        # when self.length == 2 -> 2 / 2 = 1 -> 0..1
    right_arr = self[mid_idx..-1]

    left_call = left_arr.merge_sort(&prc)
    right_call = right_arr.merge_sort(&prc)

    Array.merge(left_call, right_call, &prc)
  end

  private
  def self.merge(left_call, right_call, &prc)
    merged = []
    while !left_call.empty? && !right_call.empty?
        if prc.call(left_call[0], right_call[0]) != 1
            merged << left_call.shift
        else
            merged << right_call.shift
        end
    end
    merged + left_call + right_call
  end
end


p [4, 3, 8, 0, 5, 6].merge_sort() # => [0, 3, 4, 5, 6, 8]
p [4, 3, 8, 0, 5, 6].merge_sort() {|a, b| b <=> a} # => [8, 6, 5, 4, 3, 0]

