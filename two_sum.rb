require 'set'

def bad_two_sum?(arr, target_sum)

  arr.each_with_index do |el, i|
    arr[i + 1..-1].each do |el2|
      return true if el + el2 == target_sum
    end
  end

  false
end
#this time complexity is n^2

def okay_two_sum?(arr, target_sum)
  arr.sort!
  i, j = 0, arr.length - 1

  until i == j
    this_sum = arr[i] + arr[j]
    return true if this_sum == target_sum
    this_sum < target_sum ? i += 1 : j -= 1
  end

  false
end
# nlogn (linearithmic) complexity

def two_sum?(arr, target_sum)
  seen = Set.new()

  arr.each do |el|
    return true if seen.include?(target_sum - el)
    seen.add(el)
  end

  false
end

def three_sum?(arr, target_sum)
  arr.each_with_index do |el, i|
    return true if two_sum?(arr[0...i] + arr[i+1..-1], target_sum - el)
  end
  false
end

def four_sum?(arr, target_sum)
  arr.each_with_index do |el, i|
    return true if three_sum?(arr[0...i] + arr[i+1..-1], target_sum - el)
  end
  false
end

arr = [3, 8, 4, 2, 7, 1, 14]
p four_sum?(arr, 21)
