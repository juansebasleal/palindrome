# Main controller
class PalindromeController < ApplicationController
  before_filter :validate_params

  def get
	
	@howManyPali = 0
	# Main loop
	@cycles = 0
	# Internal loops (to figure out if it's palindrome)
	@cycles_int = 0
	for i in @x..@y
	  @cycles += 1
	  myNum = Number.new(i.to_i)
	  if myNum.isPalindrome(myNum.toBinary)
		@howManyPali += 1
	  end
	  @cycles_int += myNum.get_cycles
	end
	
	render :json =>
	{
	  :palindromes => @howManyPali.to_s,
      :cycles => (@cycles + @cycles_int).to_s,
      :complexity => "O(N) * FLOOR([CEILING(LOG(2, N)) / 2])"
    }
	
  end
  
  def validate_params
	@x = params[:x]
	@y = params[:y]
	# Thanks to http://stackoverflow.com/questions/1235863/test-if-a-string-is-basically-an-integer-in-quotes-using-ruby
	if !(@x =~ /\A[-+]?[0-9]+\z/) or !(@y =~ /\A[-+]?[0-9]+\z/)
	  render :json =>
	  {
	    :error => "#{@x} or #{@y} are not numbers",
	  }
	elsif @y < @x
	  render :json =>
	  {
	    :error => "#{@y} is less than #{@x}",
	  }
	end
	
  end
  
end
