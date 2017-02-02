# def my_min(arr)
#   arr.each_with_index do |el1, i|
#     is_smallest = true
#     arr[i+1..-1].each do |el2|
#       is_smallest = false if el2 < el1
#     end
#     return el1 if is_smallest
#   end
# end

def my_min(arr)
  minimum = arr[0]
  arr.each { |el| minimum = el if el < minimum }
  minimum
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min(list)

# def largest_contiguous_subsum(arr)
#   subarrays = []
#   arr.each_with_index do |el, i|
#     (i...arr.length).to_a.each do |j|
#       subarrays << arr[i..j]
#     end
#   end
#   subarrays.map { |subarray| subarray.reduce(&:+) }.max
# end

def largest_contiguous_subsum(arr)
  max_sum_so_far = 0
  max_sum_ending_here = 0

  arr.each do |el|
    max_sum_ending_here = [max_sum_ending_here + el, 0].max
    max_sum_so_far = [max_sum_ending_here, max_sum_so_far].max
  end

  max_sum_so_far > 0 ? max_sum_so_far : arr.max
end

list = [2, 3, -6, 7, -6, 7]
# list = [-5, -1, -3]
# list = [5, 3, -7]
puts largest_contiguous_subsum(list)
