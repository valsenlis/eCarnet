class CreateMedecins < ActiveRecord::Migration
  def change
    create_table :medecins do |t|
      t.string :nom
      t.string :lieu
      t.string :specialite
      t.string :image

      t.timestamps null: false
    end
  end
end
