    class SurveysController < ApplicationController

      def surveybyid
        survey_id = ActiveRecord::Base.connection.quote(params[:id])
        sql_query = <<-SQL
          SELECT S.survey_id as SurveyID,S.Name as SurveyName,STRING_AGG(Q.title, ', ') AS SurveysQuestions
          FROM surveys S
          INNER JOIN questions Q on S.survey_id=Q.survey_id and Q.is_deleted=0 and Q.is_deleted=0 and S.survey_id = #{survey_id}
          group by S.survey_id,S.Name
        SQL
  
        @surveybyid = ActiveRecord::Base.connection.execute(sql_query)
        render json: @surveybyid

      end 

      def surveyquestionbyid 
         survey_id = ActiveRecord::Base.connection.quote(params[:id])
         sql_query = <<-SQL
           SELECT Q.question_id as QuestionID,Q.title as QuestionTitle,
           case question_type 
            when 0 then 'text'
            when 1 then 'option'
            else 'undefined'   
           end  as QuestionType
           FROM questions Q
           INNER JOIN options O on O.question_id=Q.question_id and O.is_deleted=0
          WHERE Q.survey_id = #{survey_id} and Q.is_deleted=0
         SQL
   
         @questionbyid = ActiveRecord::Base.connection.execute(sql_query)
         render json: @questionbyid
      end

      def create
        puts "Response params: #{response_params.inspect}"
        puts "Feedback params: #{feedback_params.inspect}"
        response = Response.create!(response_params)
        feedback = Feedback.create!(feedback_params)
        if response.save && feedback.save
          render json: { Success: "Success.." }, status: :created
        else
          render json: { Error: "Unexpected failure occurred.." }, status: :unprocessable_entity
        end
      end
     
      private
      
      def response_params
        params.require(:response).permit(:response_id, :question_id, :option_id, :feedback_id, :body, :creation_time, :is_deleted) 
      end
      
      def feedback_params
        params.require(:feedback).permit(:feedback_id, :survey_id) 
      end

    end
  

