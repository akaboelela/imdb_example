class Movie < ApplicationRecord
  # Direct associations

  belongs_to :director,
             :counter_cache => true

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :castings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
