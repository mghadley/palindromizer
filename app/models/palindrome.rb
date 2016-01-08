class Palindrome < ActiveRecord::Base

	def palindromize(input_value)
		return input_value if is_palindrome?(input_value)
		array = input_value.to_s.split('').map{|chr| chr.to_i}
		mirrored = mirror(array)
		return mirrored.join.to_i if mirrored.join.to_i > array.join.to_i
		array[(array.length.to_f/2.0).round - 1] += 1
		mirrored = mirror(array)
		return mirrored.join.to_i
	end

	private

	def is_palindrome?(value)
		value.to_s == value.to_s.reverse
	end

	def mirror(array)
		mirrored = []
		(array.length.to_f/2.0).round.times do |i|
			mirrored << array[i]
		end
		(array.length/2).times do |i|
			mirrored << array[array.length/2-(i+1)]
		end
		return mirrored
	end

end
