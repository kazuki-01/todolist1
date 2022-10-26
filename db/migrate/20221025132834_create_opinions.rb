class CreateOpinions < ActiveRecord::Migration[7.0]
  def change
    create_table :opinions do |t|
      t.text :cause
      t.text :opinion

      t.timestamps
    end
  end
end
