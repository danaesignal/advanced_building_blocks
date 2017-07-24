def bubble_sort(array)
  max_swaps = (array.length) - 1
  max_sweeps = max_swaps + 1

  max_sweeps.times do |x|
    swap_happened = false

    max_swaps.times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swap_happened = true
      end
    end

    break if swap_happened == false

  end  
  return array
end

puts bubble_sort([6,3,7,2,1]).inspect
