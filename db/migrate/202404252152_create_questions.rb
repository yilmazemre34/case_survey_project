class CreateQuestions < ActiveRecord::Migration[7.1]
    def change
        create_table :questions, id: false do |t|
          t.uuid :question_id
          t.string :title
          t.integer :question_type
          t.uuid :survey_id
          t.integer :is_deleted
        end
    end
  end