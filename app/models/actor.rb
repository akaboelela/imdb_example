class Actor < ApplicationRecord
  # Direct associations

  has_many   :directions,
             :dependent => :destroy

  has_many   :castings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
