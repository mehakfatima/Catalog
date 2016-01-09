class User < ActiveRecord::Base

  rolify
  #resourcify

  #include Authority::UserAbilities
  #has_many :organizations, foreign_key: :author_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable
 
end
