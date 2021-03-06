class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id,
    message: "Same artwork can't be shared to same user more than once"}

    belongs_to :viewer,
      foreign_key: :viewer_id,
      primary_key: :id,
      class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        primary_key: :id,
        class_name: :Artwork
end
