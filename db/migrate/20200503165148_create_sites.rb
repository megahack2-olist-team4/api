class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end

    create_table :questions_sites, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text :answer_xpath

      t.timestamps
    end

    add_reference :questions_sites, :question, type: :uuid, foreign_key: true
    add_reference :questions_sites, :site, type: :uuid, foreign_key: true
  end
end
