class CreateExplanations < ActiveRecord::Migration
  def change
    create_table :explanations do |t|
      t.integer :user_id, :null => false
      t.integer :topic_id, :null => false
      t.boolean :author, :default => false
      t.timestamps
    end
  end
end
