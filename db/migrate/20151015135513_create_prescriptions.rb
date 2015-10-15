class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.references :medecin, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true
      t.string :texte
      t.date :date
      t.integer :duree

      t.timestamps null: false
    end
  end
end
