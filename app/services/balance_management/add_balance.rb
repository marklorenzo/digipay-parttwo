module BalanceManagement
	class AddBalance
		attr_accessor :user, :point

	  def initialize(user, point)
	    @user = user
	    @point = point
	  end

	  def adjust_balance
	  	new_bal = (@user.user_balance) + @point
	    @user.update_attribute(:user_balance, new_bal)
	  end 
	end
end