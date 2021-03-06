class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :series

  # should this method really be in Series ?
  def new_series(attributes)
    series.new(attributes)
  end
end
