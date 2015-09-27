require 'pry'

class Lexiconomitron

	def eat_t food
		food.gsub(/[t]/i, '')
	end

	def shazam words
		[words.first, words.last].map {|word| eat_t(word).reverse!} 
	end

	def oompa_loompa words
		small_words = words.select { |word| 	word.length <= 3 } || []
		small_words.map {|word| eat_t(word)}
	end

end