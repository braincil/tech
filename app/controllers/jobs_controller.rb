class JobsController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show]
#Checking for the user ability
load_and_authorize_resource param_method: :job_params

	def index
		if params[:search]
			@jobs = Job.search(params[:search]).page(params[:page]).per(12)
		else
	   		@jobs = Job.page(params[:page]).per(24)
		end
	end	

	def show
		@job =Job.friendly.find(params[:id])
	end

	def new		
		#@job = Job.new
		#create a new article by a user
		@job = current_user.jobs.build
	end

	def create
		#@job = Job.new(job_params)
		@job = current_user.jobs.build(job_params)
		if @job.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	def edit
	  @job =Job.friendly.find(params[:id])

	end
	

	def update
	  @job = Job.friendly.find(params[:id])
	 
		 if @job.update(job_params)
		 	redirect_to job_path(@job)
		 else
		 	render 'new'

		end
	end	

	def destroy
	  @job = Job.friendly.find(params[:id])
	  @job.destroy

	  redirect_to root_path	
	end


	


private

	def job_params
		params.require(:job).permit(:title, :body, :company, :location, :sticky, :image, :deleted,:views,:url)
	end

end
