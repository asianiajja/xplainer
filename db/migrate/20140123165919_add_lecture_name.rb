class AddLectureName < ActiveRecord::Migration
  def change
    change_table(:lectures) do |t|
      t.string :name,              :null => false, :default => ""
    end
  end
end
