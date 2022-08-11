class Board < ApplicationRecord
  mount_uploader :background_photo, BackgroundBoardUploader
  belongs_to :user
  has_many :columns

  validates_presence_of :name
end
