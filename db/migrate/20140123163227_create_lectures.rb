class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name, :null => false, :default => ""
      t.integer :version, :null => false, :default => 1
      t.boolean :public, :null => false, :default => true
      t.string :encrypted_password, :null => true, :default => nil
      t.string :salt, :null => true, :default => nil
      t.timestamps
    end
  end
end
