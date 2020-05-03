class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text :description
      t.text :keywords
      t.boolean :public

      t.timestamps
    end

    create_join_table :categories, :questions, {
      column_options: { null: false, type: :uuid, foreign_key: true }
    }

    add_reference :questions, :related, {
      type: :uuid, foreign_key: { to_table: 'questions' }
    }
  end
end
