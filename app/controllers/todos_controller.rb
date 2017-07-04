class TodosController < ApplicationController
  
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
    @todo = Todo.find(params[:id])
  end  
  
  
  private # anything under here is only available to this particular controller
  
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
  
end