class DucksController < ApplicationController

  before_action :find_duck, only: [:show, :edit, :update]

  def index
    @ducks = Duck.all
  end

  def new
    @duck = Duck.new
    @students = Student.all
  end

  def show
  end

  def edit
  end 

  def create
    @duck = Duck.create(duck_params)
    
    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      flash[:errors_array] = @duck.errors.full_messages
      redirect_to new_duck_path
    end
  end

  def update
    @duck.update(duck_params)
    redirect_to duck_path(@duck)
  end

  def find_duck
    @duck = Duck.find(params[:id])
  end 

  private
  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
