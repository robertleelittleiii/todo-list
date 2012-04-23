class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json=>@todos} 
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json=>@todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json=>@todo}
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, :notice=>"Todo was successfully created." }
        format.json { render :json=>@todo, :status=>:created, :location=>@todo }
      else
        format.html { render :action=>"new" }
        format.json { render :json=>@todo.errors, :status=>:unprocessable_entry }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, :notice=>"Todo was successfully updated."}
        format.json { head :ok }
      else
        format.html { render :action=>"edit" }
        format.json { render :json=>@todo.errors, :status=>"unprocessable_entry" }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy  

    
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to request.env['HTTP_REFERER'] }
      format.json { head :ok }
    end
  end
  
   # CREATE_EMPTY_RECORD /todos/1
   # CREATE_EMPTY_RECORD /todos/1.json

  def create_empty_record
    
    @todo = Todo.new
    @todo.name= "New Todo Item"
    @todo.priority = 100
    @todo.user_id=session[:user_id]
    @todo.todo_list_id=params[:todo_list_id] || 0
    @todo.save
    
    redirect_to(:controller=>:todos, :action=>:edit, :id=>@todo)
  end

   def sort
    @todos = Todo.where(:todo_list_id=>params[:todo_list_id])
    @todos.each do |todo|
      puts(todo.id)
      todo.priority = params['task'].index(todo.id.to_s) + 1
      todo.save
    end

    render :nothing => true
  end
end
