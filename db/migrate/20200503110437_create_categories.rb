class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: true
      t.text :description
      t.text :keywords

      t.timestamps
    end
  end
end
