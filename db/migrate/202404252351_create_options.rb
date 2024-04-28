class CreateOptions < ActiveRecord::Migration[7.1]
    def change
        create_table :options, id: false do |t|
            t.uuid :option_id
            t.string :title
            t.uuid :question_id
            t.integer :is_deleted
        end
        
    end
  end