class Director < ApplicationRecord
  # Direct associations

  has_many   :directions,
             :dependent => :destroy

  has_many   :movies,
             :dependent => :destroy

  # Indirect associations

  has_many   :actors,
             :through => :directions,
             :source => :actor

  # Validations

end
