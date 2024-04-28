class CreateResponses < ActiveRecord::Migration[7.1]
    def change
        create_table :responses, id: false do |t|
            t.uuid :response_id
            t.uuid :question_id
            t.uuid :option_id
            t.uuid :feedback_id
            t.string :body
            t.datetime :creation_time
            t.integer :is_deleted

        end
    end
  end