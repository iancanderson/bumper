class Song < ApplicationRecord
  belongs_to :recording, required: false
end
