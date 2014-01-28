class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, :null => false, :default => ""
      t.text :content, :null => false, :default => ""
      t.integer :version, :null => false, :default => 1
      
      t.integer :lecture_id, :null => false
      t.integer :question_id, :null => true, :default => nil
      t.timestamps
    end
  end
end
