class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  
  attr_accessible :content, :avatar

  has_attached_file :avatar, styles: { medium:"300x300>", thumb:"250x250>" }
  

  belongs_to :user

  validates :content, presence: true
  validates :content, length: { maximum: 100 }
  validates_attachment :avatar, content_type: { content_type: /^image\/(png|gif|jpg|jpeg)/ }
  validates_attachment :avatar, size: {in: 0..100.kilobytes}

  default_scope order("created_at DESC")
end
