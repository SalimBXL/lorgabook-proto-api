class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :draft, default: true
      t.string :batch_number

      t.references :author, null: false, foreign_key: true
      t.references :article_category, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
