class EmployeesProjects < ActiveRecord::Migration
  def change
    create_join_table(:employees, :projects) do |t|
      t.timestamps()
    end
  end
end
