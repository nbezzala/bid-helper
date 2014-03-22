class CreateTaskSeekers < ActiveRecord::Migration
  def change
    create_table :task_seekers do |t|

      t.timestamps
    end
  end
end
