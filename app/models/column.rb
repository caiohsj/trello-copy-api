class Column < ApplicationRecord
  belongs_to :board
  has_many :cards

  validates_presence_of :title

  def default_serializer
    serializable_hash(
      except: [:created_at, :updated_at],
    )
  end
end
