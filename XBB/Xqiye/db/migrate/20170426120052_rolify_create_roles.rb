class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:workeraccounts_roles, :id => false) do |t|
      t.references :workeraccount
      t.references :role
    end

    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:workeraccounts_roles, [ :workeraccount_id, :role_id ])
  end
end
