class CreateCitiesWorkeraccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :cities_workeraccounts do |t|
      t.references :city
      t.references :workeraccount
    end
  end
end
