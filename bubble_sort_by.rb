def bubble_sort_by(array)
    i = 0
    array.length.times do
        i += 1
        array.map.with_index do |word, index|
            if index < (array.length - i)
                if yield(array[index],array[index + 1]) > 0
                  array[index],array[index + 1] = array[index + 1],array[index]
                end
            end
        end
    end
    print array
    return array
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end