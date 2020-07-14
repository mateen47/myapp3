class TodosController<ApplicationController
	before_action :set_todo, only: [:edit, :update, :destroy, :show]
	def new
		@todo = Todo.new
	end
	def create 
		@todo = Todo.new(todo_params)
		if @todo.save
			flash.alert="SAVED"
			redirect_to todo_path(@todo)
		else
			flash.alert="ERROR"
			render 'new'
		end
	end 
	def show
		
	end
	def edit
		
	end
	def update
		

		if @todo.update(todo_params)
			flash[:notice]="Todo was successfully updated"
			redirect_to todo_path(@todo)
		else
			flash[:notice]="Todo was not updated"
			render 'edit'
		end
	end
	def index
		@todos = Todo.all
	end
	def destroy
		
		tempname = @todo.name
		@todo.destroy
		flash[:notice]=tempname+"  Deleted";
		redirect_to todos_path
	end
	private
	def set_todo
		@todo = Todo.find(params[:id])
	end
	def todo_params
		params.require(:todo).permit(:name , :description)
	end

end