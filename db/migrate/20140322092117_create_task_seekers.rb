class CreateTaskSeekers < ActiveRecord::Migration
  def change
    create_table :task_seekers do |t|
      t.string :name
      t.number :rate
      t.string :when
      t.string :location
      t.number :distance
      t.date :created
      t.date :updated

      t.timestamps
    end
  end
end
