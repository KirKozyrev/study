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
      def my_map
        result = MyArray.new

        my_each do |item|
          result.push(yield(item))
        end

        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new

        my_each do |item| 
          result.push(item) if item != nil
        end

        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        result = init

        my_each do |item|
          if result.nil?
            result = item
          else
            result = yield(result, item)
          end
        end

        result
      end
    end
  end
end
