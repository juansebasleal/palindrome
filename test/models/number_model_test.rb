require 'test_helper'

class NumberModelTest < ActionController::TestCase
  #test "should get get" do
  #  get :get/1/10
  #  assert_response :success
  #end
  
  test "50 to binary" do
	mynum = Number.new(50)
	assert_equal( "110010", mynum.toBinary )
  end
  
  test "999999 to binary" do
	mynum = Number.new(999999)
	assert_equal( "11110100001000111111", mynum.toBinary )
  end
  
  test "Even palindrome 1001001001 to binary" do
	mynum = Number.new(585)
	assert( mynum.isPalindrome(mynum.toBinary) )
	assert_equal( 5, mynum.get_cycles )
  end
  
  test "Odd palindrome 1110111 to binary" do
	mynum = Number.new(119)
	assert( mynum.isPalindrome(mynum.toBinary) )
	assert_equal( 3, mynum.get_cycles )
  end
  
  test "Even NOT palindrome 10100111 to binary" do
	mynum = Number.new(167)
	assert_not( mynum.isPalindrome(mynum.toBinary) )
	assert_equal( 2, mynum.get_cycles )
  end
  
  test "Odd NOT palindrome 1110011 to binary" do
	mynum = Number.new(115)
	assert_not( mynum.isPalindrome(mynum.toBinary) )
	assert_equal( 3, mynum.get_cycles )
  end

end
