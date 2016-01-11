class User < ActiveRecord::Base

  rolify 

  before_create :set_default_role

  #include Authority::UserAbilities
  #has_many :organizations, foreign_key: :author_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable
 
  private
  def set_default_role
    self.add_role :user
  end
end
