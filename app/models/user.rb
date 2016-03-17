class User < ActiveRecord::Base
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
