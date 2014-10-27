class JobsController < ApplicationController
	

	def index
		if params[:search]
			@jobs = Job.search(params[:search]).order("sticky DESC, created_at DESC")
		else
	   		@jobs = Job.page(params[:page]).per(12)
		end
	end	

	def show
		@job =Job.find(params[:id])
	end

	def new		
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	def edit
	  @job =Job.find(params[:id])

	end

	def update
	  @job = Job.find(params[:id])
	 
		 if @job.update(job_params)
		 	redirect_to job_path(@job)
		 else
		 	render 'new'

		end
	end	

	def destroy
	  @job = Job.find(params[:id])
	  @job.destroy

	  redirect_to root_path	
	end


	








private
	def job_params
		params.require(:job).permit(:title, :body, :company, :location, :sticky, :image)
	end

end
