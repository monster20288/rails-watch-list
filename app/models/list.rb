class List < ApplicationRecord
  #Set Validation
  validates :name, uniqueness: true
  validates :name, presence: true
  has_one_attached :photo
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
end
