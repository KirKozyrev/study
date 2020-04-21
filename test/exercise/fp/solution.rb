module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        films_rates = 
          films.select { |film| 
            film["rating_kinopoisk"] != nil && film["rating_kinopoisk"].to_f > 0 && film["country"] != nil && film["country"].split(",").length > 1
          }.map { |film|
            film["rating_kinopoisk"].to_f
          }
        
        rates_sum = films_rates.reduce do |sum, rate| 
          sum + rate
        end
        
        rates_sum /= films_rates.length
      end

      def chars_count(films, threshold)
        films_name = 
          films.select { |film| 
            film["rating_kinopoisk"] != nil && film["rating_kinopoisk"].to_f >= threshold
          }.map { |film|
            film["name"]
          }
      
        count_char = []
      
        films_name.each do |film|
          char_count = 0
          film.each_char do |char|
            char_count += 1 if char == 'и'
          end
          count_char.push(char_count)
        end
      
        char_sum = count_char.reduce do |sum, item| 
          sum + item
        end

        char_sum
      end
    end
  end
end
