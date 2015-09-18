class Admin < ActiveRecord::Base
  has_many :pictures
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :timeoutable, :lockable
end
