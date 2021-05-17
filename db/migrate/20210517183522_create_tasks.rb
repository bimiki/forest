class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :status
      t.references :notes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
