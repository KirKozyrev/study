module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each

      def my_each(&block)
        return self if self.empty?

        first, *rest = self
        block.call(first)

        MyArray.new(rest).my_each(&block)   
        self  
      end

      # Написать свою функцию my_map
      def my_map(&block)
        result = MyArray.new

        self.my_reduce(result) do |result, item|
           result.push(block.call(item))
        end

        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new

        self.my_reduce(result) do |result, item|
           if item.nil?
             result 
           else 
            result.push(item)
           end
        end

        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(result = nil, &block)
        return result if self.empty?

        if result == nil 
          result = self.first
          first, *rest = self
        else 
          first, *rest = self
          result = block.call(result, first)
        end

        MyArray.new(rest).my_reduce(result, &block);
      end
    end
  end
end
