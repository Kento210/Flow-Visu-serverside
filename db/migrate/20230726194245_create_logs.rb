class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.integer :time
      t.string :tagId
      t.integer :stepNo
      t.string :boothId
      t.string :operator
      t.string :content

      t.timestamps
    end
  end
end
