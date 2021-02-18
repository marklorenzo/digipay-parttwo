module BalanceManagement
	class DeductBalance
		attr_accessor :user, :point

	  def initialize(user, point)
	    @user = user
	    @point = point
	  end

	  def adjust_balance
	  	new_bal = (@user.user_balance) - @point
	  	new_bal = if new_bal <= 0
	  			 				0
	  			 			else
	  			 				new_bal
	  			 			end
	    @user.update_attribute(:user_balance, new_bal)
	  end 
	end
end