class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
    end
  end
end
