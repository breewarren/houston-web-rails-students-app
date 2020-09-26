class InstructorsController < ApplicationController
    before_action :find_instructor_by_id, only: [:show, :edit, :update, :destroy]

    def index
        @instructors = Instructor.all
    end

    def show
        # @instructor = Instructor.find(params[:id])
    end

    def new
        @instructor = Instructor.new
    end

    def create
        @instructor = Instructor.new(instructor_params)
        if @instructor.valid?
            @instructor.save
            redirect_to @instructor
        else
            flash[:errors] = @instructor.errors.full_messages
            redirect_to new_instructor_path
        end
    end

    def edit
        # @instructor = Instructor.find(params[:id])
    end

    def update
        # @instructor = Instructor.find(params[:id])
        @instructor.update(instructor_params)
        redirect_to @instructor
    end
    
    def destroy
        # @instructor = Instructor.find(params[:id])
        flash[:notice] = "Instructor deleted successfully."
        @instructor.destroy
        redirect_to instructors_path
    end

    private

    def instructor_params
        params.require(:instructor).permit(:name)
    end

    def find_instructor_by_id
        @instructor = Instructor.find(params[:id])
    end

end