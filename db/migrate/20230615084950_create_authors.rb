class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :fullname
      t.string :email
      t.references :groupe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
