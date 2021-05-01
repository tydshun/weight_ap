class Blog < ApplicationRecord
  validates :user_id, presence:true
  validates :title, presence: true,length: { in: 1..20}
  belongs_to :user

  def self.search(search)
    
    if search
      Blog.where('title LIKE ? OR content LIKE ?', "%#{search}%","%#{search}%")
    else
      Blog.all
    end
  end
end
