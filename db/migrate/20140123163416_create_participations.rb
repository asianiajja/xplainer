class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :user_id, :null => false
      t.integer :lecture_id, :null => false
      t.boolean :online, :null => false, :default => false
      t.timestamps
    end
  end
end
