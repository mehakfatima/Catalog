class Organization < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    resourcify
  has_many :products , :dependent => :destroy
  validates :name, uniqueness: true, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable
end
