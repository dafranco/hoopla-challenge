class CreateHooplaClients < ActiveRecord::Migration[5.2]
  def change
    create_table :hoopla_clients do |t|

      t.timestamps
    end
  end
end
