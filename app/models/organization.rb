class Organization < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  resourcify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable
end
