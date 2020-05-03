class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :name

      t.timestamps
    end

    add_reference :products, :category, {
      type: :uuid, foreign_key: { to_table: 'categories' }
    }
  end
end
