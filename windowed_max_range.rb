def windowed_max_range(arr, window_size)
  current_max_range = nil

  num_windows = arr.length - window_size + 1

  num_windows.times do |i|
    this_window = arr[i...(i + window_size)]
    this_range = this_window.max - this_window.min
    if current_max_range.nil? || this_range > current_max_range
      current_max_range = this_range
    end
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
