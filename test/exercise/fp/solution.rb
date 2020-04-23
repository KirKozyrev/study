module Exercise
  module Fp
    class << self
      def rating(films)
        films_rates = 
          films.select { |film| 
            (film["rating_kinopoisk"] != nil && film["rating_kinopoisk"].to_f > 0) && 
            (film["country"] != nil && film["country"].split(",").length > 1)
          }.map { |film|
            film["rating_kinopoisk"].to_f
          }
        
        rates_sum = films_rates.reduce do |sum, rate| 
          sum + rate
        end
        
        rates_sum /= films_rates.length
      end

      def chars_count(films, threshold)
        count_char = 
          films.select { |film| 
            film["rating_kinopoisk"] != nil && film["rating_kinopoisk"].to_f >= threshold
          }.map { |film|
            film["name"].count('и')
          }
            
        char_sum = count_char.reduce do |sum, item| 
          sum + item
        end

        char_sum
      end
    end
  end
end
