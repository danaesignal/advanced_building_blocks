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

def bubble_sort_by(array, &do_this)
  max_swaps = (array.length) - 1
  max_sweeps = max_swaps + 1

  max_sweeps.times do |x|
    swap_happened = false

    max_swaps.times do |i|
      if yield(array[i], array[i+1]) > 0
        array[i], array[i+1] = array[i+1], array[i]
        swap_happened = true
      end
    end

    break if swap_happened == false

  end
  return array
end

def collector
  hopper = []
  input = "start"

  puts "Entry mode."
  puts "Enter numbers to be sorted, one per line."
  puts "Non-numeric entries will be treated as zero."
  puts "Type exit to end entry mode and begin sorting."

  while input.downcase != "exit"
    input = gets.chomp
    next if input.downcase == "exit"
    hopper.push(input.to_i)
  end

  return hopper
end

puts bubble_sort([4,3,78,2,0,2]).inspect

puts bubble_sort_by(["hi","hello","hey"]) {|left,right|
  left.length - right.length
}.inspect

# puts bubble_sort(collector).inspect
