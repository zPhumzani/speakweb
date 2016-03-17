class Article < ActiveRecord::Base
  default_scope -> {order("created_at DESC")}
  acts_as_votable
  belongs_to :user
  belongs_to :category

  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessor :file
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments
  validates :title, :body, :category_id, :user_id, presence: true

	def initialize(params={}) 
		@file = params.delete(:file)
		super
		if @file
			self.filename = sanitize_filename(@file.original_filename)
			self.content_type = @file.content_type
			self.file_contents = @file.read
		end
	end

	def all_tags=(name)
		self.tags = name.split(", ").map do |name|
			Tag.where(name: name.strip.downcase).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
		Tag.includes(:taggings).find_by_name!(name).articles
	end

  def to_s
  	title
  end

	private
	  def sanitize_filename(filename)
	  	return File.basename(filename)
	  end
end
