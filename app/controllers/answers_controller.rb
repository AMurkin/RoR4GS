class AnswersController < ApplicationController
	
	def show
		@answer = Answer.find(params[:id])
		@question = Question.find(@answer.question_id)
	end

	def create
		question = Question.find(params[:answer][:question_id])
		answer = question.answers.create(answer_params)
		
		MainMailer.notify_question_author(answer).deliver_now

		session[:current_user_email] = answer_params[:email]
		redirect_to question
	end

	private

	def answer_params
		params.require(:answer).permit(:email, :body)
	end
end
