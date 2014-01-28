class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :lecture_id, :null => false
      t.timestamps
    end
  end
end
