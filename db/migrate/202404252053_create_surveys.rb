class CreateSurveys < ActiveRecord::Migration[7.1]
    
    def change
        create_table :surveys, id: false do |t|
            t.uuid :survey_id 
            t.string :name
            t.integer :is_deleted
        end 
    end
  end