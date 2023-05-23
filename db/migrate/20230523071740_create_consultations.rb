class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer  :patient_id
      t.boolean :open, default: true
      t.timestamps
    end
  end
end
