class Employees < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:first_name, :string)
      t.column(:last_name, :string)
      t.column(:email, :string)

      t.timestamps()
    end
  end
end
