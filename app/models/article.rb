

class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  
  friendly_id :title, use: %i[slugged history]
  
  def should_generate_new_friendly_id?
  title_changed? || slug.blank?
  end
  
end



