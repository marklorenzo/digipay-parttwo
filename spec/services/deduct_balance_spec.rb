require 'spec_helper'
include BalanceManagement

RSpec.describe 'Multiple request' do
  let(:valid_attributes) {
    {
      name: 'John Smith',
      email: 'John Smith'
    }
  }  
  context 'Successful' do
    it 'deduct user balance' do
      User.delete_all
      user = User.create(name: 'John Smith', email: 'John Smith')
      user.save!
      @user = User.first   
      threads = 30.times.map do
        Thread.new do
          ActiveRecord::Base.connection_pool.with_connection do
            DeductBalance.new(@user,1).adjust_balance
          end
        end
      end      
      threads.each(&:join) 
      expect(@user.user_balance).to eq(0.0)
    end
  end
end
