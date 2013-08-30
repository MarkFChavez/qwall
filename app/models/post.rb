class Post < ActiveRecord::Base
  attr_accessible :content, :avatar

  has_attached_file :avatar, styles: { medium:"300x300>", thumb:"250x250>" }

  belongs_to :user

  validates :content, presence: true
  validates :content, length: { maximum: 100 }

  default_scope order("created_at DESC")
end
