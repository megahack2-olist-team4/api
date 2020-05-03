class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end

    create_join_table :sites, :questions, {
      column_options: { null: false, type: :uuid, foreign_key: true }
    } do |t|
      t.text :answer_xpath
    end
  end
end
