class CreateWorkersCites < ActiveRecord::Migration[5.0]
  def change
    create_table :workers_cites do |t|
      t.references :city
      t.references :worker
    end
  end
end
