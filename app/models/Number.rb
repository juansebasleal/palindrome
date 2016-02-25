# Class number
class Number

  def initialize(value, system="dec")
	raise ArgumentError, 'Argument must be a number' unless value.is_a? Numeric
    # Actual value of the number: 435, 10000100001
    @value = value
	# Decima 'dec' or Binary 'bin'
	@system = system
	# Count cycles to figure out where it is palindrome
	@cycles = 0
  end
  
  def get_cycles
    @cycles
  end
  
  #
  def toBinary
    return @value.to_s(2)
  end
  
  # 
  def isPalindrome(num)
    # Loop only over half of the string
    limit = (num.length/2).floor - 1
	for i in 0..limit
	  @cycles += 1
	  return false if num[i] != num[num.length-(i+1)]
	end
	# Every comparison was satisfactory, so it is palindrome
	return true
  end

end