class Column < ApplicationRecord
  belongs_to :board
  has_many :cards

  validates_presence_of :title
end
