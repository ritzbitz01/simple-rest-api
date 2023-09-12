class AddResolvedByToIncidents < ActiveRecord::Migration[7.0]
  def change
    add_column :incidents, :resolved_by, :string, default: nil
  end
end
