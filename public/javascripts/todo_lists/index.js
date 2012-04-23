/* 
    Document   : /todo_list/index/
    Created on : April 18, 2012, 11:20:32 PM
    Author     : rlittle
    Description:
        javascript for index page.
*/

function bindRowClickTodoItem(){
    
    $(".todo-row").click(function() {
        var todo_id = $(this).find("#todo-item-id").html().trim();
        window.location.href ='/todos/'+todo_id + "/edit";
        return true;
    });
}

function bindRowClickTodoList(){
    $(".todo-list-row").click(function() {
        alert(target);
        var todo_list_id = $(this).find("#todo-list-id").html().trim();
        window.location.href ='/todo_lists/'+todo_list_id + "/edit";
        return true;
    });
}

function bindSortableToTodos() {
    
    $('ul#todos-sortable').sortable({
        axis: 'y',
        dropOnEmpty: false,
        handle: 'td.handle',
        cursor: 'crosshair',
        items: 'li',
        opacity: 0.4,
        scroll: true,
        update: function(){
            todo_list_id = $("#todo-list-id").html().trim();

            $.ajax({
                type: 'post',
                data: $('#todos-sortable').sortable('serialize') + "&todo_list_id=" + todo_list_id ,
                dataType: 'script',
                complete: function(request){
                    $('#task').effect('highlight');
                },
                url: '/todos/sort'
            })
        }
    });    
}


$(document).ready(function(){
   bindSortableToTodos();
   bindRowClickTodoItem();
   bindRowClickTodoList();   
});