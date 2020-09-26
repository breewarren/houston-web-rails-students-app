class StudentsController < ApplicationController
    before_action :find_student_by_id, only: [:show, :edit, :update, :destroy]


    def index
        @students = Student.all
    end
    
    def show
        # @student = Student.find(params[:id])
    end
    
    def new
        @student = Student.new
    end
    
    def create
        @student = Student.new(student_params)
        if @student.valid?
            @student.save
            redirect_to @student
        else
            flash[:errors] = @student.errors.full_messages
            redirect_to new_student_path
        end
    end
    
    def edit
        # @student = Student.find(params[:id])
    end
    
    def update
        # @student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to @student
    end
        
    def destroy
        # @student = Student.find(params[:id])
        @student.destroy
        flash[:notice] = "Student deleted successfully."
        redirect_to students_path
    end
    
    private
    
    def student_params
        params.require(:student).permit(:name, :major, :age, :instructor_id)
    end

    def find_student_by_id
        @student = Student.find(params[:id])
    end
    

    
end
