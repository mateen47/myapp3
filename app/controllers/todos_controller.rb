class TodosController<ApplicationController
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
		@todo = Todo.find(params[:id])
	end
	def edit
		@todo = Todo.find(params[:id])
	end
	def update
		@todo = Todo.find(params[:id])

		if @todo.update(todo_params)
			flash[:notice]="Todo was successfully updated"
			redirect_to todo_path(@todo)
		else
			flash[:notice]="Todo was not updated"
			render 'edit'
		end
	end

	private
	def todo_params
		params.require(:todo).permit(:name , :description)
	end

end