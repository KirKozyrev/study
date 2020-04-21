module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        newarr = []

        array.each do |item|
          max = item if item > max
        end

        array.each do |item|
          if item > 0
            newarr.push(max)
          else
            newarr.push(item)
          end
        end

        newarr
      end

      def search(array, query, *array_range)
        return -1 if array.empty?
        return 0 if array.length == 1 && array[0] == query
        return -1 if array.length == 1

        arr_start = array_range[0] || 0
        arr_end = array_range[1] || array.length

        return -1 if arr_start >= arr_end

        arr_middle = arr_start + (arr_end - arr_start) / 2

        return arr_middle if array[arr_middle] == query

        if array[arr_middle] > query 
          search(array, query, arr_start, arr_middle)
        else
          search(array, query, arr_middle + 1, arr_end)
        end
      end
    end
  end
end
