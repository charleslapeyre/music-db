class Artist < ApplicationRecord
  belongs_to :genre
  has_many :songs
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :genre_id, presence: true
  validates :genre, presence: true
end

# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_artists_on_genre_id  (genre_id)
#
