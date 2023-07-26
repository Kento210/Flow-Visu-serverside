class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :boothId
      t.string :status
      t.string :tagId
      t.integer :startTime
      t.string :operator

      t.timestamps
    end
  end
end
