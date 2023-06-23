class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.references :resource_category, null: false, foreign_key: true
      t.references :resource_location, null: false, foreign_key: true
      t.references :reference_person, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
