class User < ApplicationRecord
  include Devise::TokenAuthenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :token_authenticatable

  has_many :boards
  has_many :columns, through: :boards
  has_many :cards, through: :columns

  validates_presence_of :name
end
