class PalindromeController < ApplicationController

	def show
		@value = Palindrome.new
	end

	def create
		safe_params = params.require(:palindrome).permit(:input_value)
		@value = Palindrome.new(safe_params)
		@value.palindrome = @value.palindromize(@value.input_value)
		@value.save
		#render body: YAML::dump(@value)
		redirect_to show_p_path(id: @value.id)
	end

	def show_p
		@value = Palindrome.find(params[:id])
	end

	def display
		@data = Palindrome.all
	end
end
