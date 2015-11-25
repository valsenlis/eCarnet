class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.integer :answer1
      t.integer :answer2
      t.integer :answer3

      t.timestamps null: false
    end
  end
end
