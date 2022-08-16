class Board < ApplicationRecord
  include ActiveModel::Serialization
  mount_uploader :background_photo, BackgroundBoardUploader
  belongs_to :user
  has_many :columns

  validates_presence_of :name

  def show_serializer
    serializable_hash(
      except: [:created_at, :updated_at],
      include: {
        columns: {
          except: [:created_at, :updated_at],
          include: {
            cards: { except: [:created_at, :updated_at] }
          }
        }
      }
    )
  end
end
