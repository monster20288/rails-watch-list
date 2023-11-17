class Movie < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :overview, presence: true
  has_many :list, through: :bookmarks
  has_many :bookmarks
end
