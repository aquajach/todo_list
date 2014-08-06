require 'spec_helper'

describe 'Create tasks', type: :request do
  it 'creates a task from a form and display it into a list' do
    get '/tasks'

    assert_select 'form' do
      assert_select 'select#task_due_date'
      assert_select 'input#task_name'
      assert_select 'input[type=?]', 'submit'
    end

    post '/tasks', task: {name: 'A NEW TASK', due_date: '2014-08-01'}

    get '/tasks'
    assert_select 'li .task-due-date', text: '2014-08-01 Friday' #Hint: strftime method is used to format date/time
    assert_select 'li .task-name', text: 'A NEW TASK'
  end
end