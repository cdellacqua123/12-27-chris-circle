class Array
    def quicksort(&prc)
        return self if self.length <= 1
        # p self
        pivot_ele = self.first

        prc ||= Proc.new{|a, b| a <=> b}

        # left_arr = self[1..-1].select {|ele| prc.call(ele, pivot_ele) != 1}
        # right_arr = self[1..-1].select {|ele| prc.call(ele, pivot_ele) == 1}

        left_arr = []
        right_arr = []
        self[1..-1].each do |ele|
            if prc.call(ele, pivot_ele) != 1
                left_arr << ele
            else
                right_arr << ele
            end
        end

        left_sorted = left_arr.quicksort(&prc)
        right_sorted = right_arr.quicksort(&prc)
        left_sorted + [pivot_ele] + right_sorted
    end
end


arr = [2, 3, 8, 1, 5, 4, 3, 6, 7, 10, 1, 2, 9]
p arr.quicksort
    # => [1, 1, 2, 2, 3, 3, 4, 5, 6, 7, 8, 9, 10]
p arr.quicksort { |a, b| b <=> a } 
    # => [10, 9, 8, 7, 6, 5, 4, 3, 3, 2, 2, 1, 1]