class CreateIncidents < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.string :sys_id
      t.string :number

      t.timestamps
    end
  end
end
