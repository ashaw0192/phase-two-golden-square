require './lib/todo_list_integration/todo_list'
require './lib/todo_list_integration/todo'

RSpec.describe "todo list integration" do
  context "after adding some tasks to do" do
    it "returns them as a list of incomplete tasks" do
        todo_list = TodoList.new
        todo_1 = Todo.new("Wash car")
        todo_2 = Todo.new("Bake bread")
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        expect(todo_list.incomplete).to eq [todo_1, todo_2]
    end
  end

  context "when marking a task as complete" do
    it "removes the task from incomplete and adds it to complete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Wash car")
      todo_2 = Todo.new("Bake bread")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      expect(todo_list.complete).to eq [todo_1]
      expect(todo_list.incomplete).to eq [todo_2]
    end
  end

  context "when calling give_up!" do
    it "marks all tasks as complete and removes them from incomplete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Wash car")
      todo_2 = Todo.new("Bake bread")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      expect(todo_list.complete).to eq [todo_1, todo_2]
      expect(todo_list.incomplete).to eq []
    end
  end
end