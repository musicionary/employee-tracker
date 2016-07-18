class CreateProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |t|
      t.column(:client, :string)
      t.column(:description, :string)
      t.column(:due_date, :date)

      t.timestamps()
    end
  end
end
