class Direction < ApplicationRecord
  # Direct associations

  belongs_to :actor

  belongs_to :director

  # Indirect associations

  # Validations

end
