class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.integer :question_id, :null => false
      t.integer :user_id, :null => false
      
      t.boolean :answered, :null => false, :default => false
      t.boolean :creator, :null =>false, :default => false
      t.timestamps
    end
  end
end
