class AddStepNoToStatuses < ActiveRecord::Migration[7.0]
  def change
    add_column :statuses, :stepNo, :integer
  end
end
