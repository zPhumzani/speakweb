class Category < ActiveRecord::Base
  has_many :articles
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
end
