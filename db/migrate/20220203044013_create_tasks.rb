class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :duedate

      t.timestamps
    end
  end
end
