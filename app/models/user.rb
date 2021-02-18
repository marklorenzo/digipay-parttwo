class User < ActiveRecord::Base
  validates :name, presence: true
  after_initialize :init

  def init
    self.user_balance = 30
  end
end
