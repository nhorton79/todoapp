class TodosController < ApplicationController
  
# this part of code allows us to run a specific method 'set_todo' before 
# it runs the edit, update, show and destroy methods
  before_action :set_todo, only: [:edit, :update, :show, :destroy]
  
  
  def new
    @todo = Todo.new
  end
  
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully!"   #Displays a message (flash is a temporary hash)
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  
  def show
  end  
  
  
  def edit
  end  
  
  
  def index
    @todos = Todo.all
  end
  
  
  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end  
  
  def destroy
    @todo.destroy
    flash[:notice] = "Todo deleted successfully"
    redirect_to todos_path
  end
  
  
  private # anything under here is only available to this particular controller
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
  
end