class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name, :null => false, :default => ""
      t.integer :version, :null => false, :default => 1
      t.boolean :public, :null => false, :default => true
      t.string :password, :null => true, :default => nil
      t.timestamps
    end
  end
end
