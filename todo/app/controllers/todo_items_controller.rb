class TodoItemsController < ApplicationController

    def create
        @todo_list = TodoList.find(params[:todo_list_id])
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        @todo_item.save
        redirect_to @todo_list
    end

    def edit
        @todo_list = TodoList.find(params[:todo_list_id])
        @todo_item = @todo_list.todo_items.find(params[:id])
    end
    def update
        @todo_list = TodoList.find(params[:todo_list_id])
        @todo_item = @todo_list.todo_items.find(params[:id])
        if @todo_item.update(todo_list_params)
            redirect_to @todo_list
        else
            render 'edit'
        end
    end



    def destroy
        @todo_list = TodoList.find(params[:todo_list_id])
        @todo_item = @todo_list.todo_items.find(params[:id])
        @todo_item.destroy
        redirect_to @todo_list
    end

private
    def todo_item_params
        params.require(:todo_item).permit(:content)
    end


end
