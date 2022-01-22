# O(n) Time O(1) Space
def anagram?(str1, str2)
    letter_counts1 = Hash.new(0)
    letter_counts2 = Hash.new(0)

    str1.each_char { |letter| letter_counts1[letter] += 1 }
    str2.each_char { |letter| letter_counts2[letter] += 1 }

    letter_counts1 == letter_counts2
end

# def anagram?(str1, str2)
#     letter_counts1 = Hash.new(0)

#     str1.each_char { |letter| letter_counts1[letter] += 1 }
#     str2.each_char { |letter| letter_counts1[letter] -= 1 }


#     letter_counts1.each_value.all? { |sum| sum == 0 }
# end


# O(n) time and space
def two_sum?(arr, target_sum)
    values = {}

    arr.each do |el|
    return true if values[target_sum - el]
    values[el] = true
    end

    false
end



# O(n^3) time & space
def largest_contiguous_subsum1(array)
    subs = []

    array.each_index do |idx1|
        (idx1..array.length - 1).each do |idx2|
        subs << array[idx1..idx2]
        end
    end

    subs.map { |sub| sub.inject(:+) }.max
end



# O(n) time & constant space
def contiguous_sub_sum(array)
    max_sum = array.first
    running_sum = 0
    
    array.each do |num|
        running_sum += num

        max_sum = running_sum if running_sum > max_sum
        running_sum = 0 if running_sum < 0
    end

    max_sum
end