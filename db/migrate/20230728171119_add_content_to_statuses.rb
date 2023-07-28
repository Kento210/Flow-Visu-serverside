class AddContentToStatuses < ActiveRecord::Migration[7.0]
  def change
    add_column :statuses, :content, :string
  end
end
