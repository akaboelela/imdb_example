class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :director_id
      t.integer :actor_id

      t.timestamps

    end
  end
end
