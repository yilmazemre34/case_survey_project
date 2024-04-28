class CreateFeedbacks < ActiveRecord::Migration[7.1]
    def change
        create_table :feedbacks, id: false do |t|
            t.uuid :feedback_id
            t.uuid :survey_id
        end
    end
  end