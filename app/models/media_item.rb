class MediaItem < ActiveRecord::Base
  belongs_to :user

  validates :title, :link, presence: true
end
