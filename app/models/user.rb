class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_cadidates, use: :slugged

  def slug_cadidates
  	[
  	  :first_name,
  	  [:first_name, :last_name]
  	]
  end
  has_many :articles
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: :true
  validates :password, presence: true

  def to_s
  	"#{first_name} #{last_name}"
  end
end
