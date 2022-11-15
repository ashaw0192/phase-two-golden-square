require './lib/todo_list_integration/todo_list'
require './lib/todo_list_integration/todo'

RSpec.describe "todo list integration" do
  context "calling complete or incomplete before anything added" do
    it "returns an empty list" do
      todo_list = TodoList.new
      expect(todo_list.incomplete).to eq []
      expect(todo_list.complete).to eq []
    end
  end
  
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

  context "trying to add the same task twice while first incomplete" do
    it "fails" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Wash car")
      todo_2 = Todo.new("Wash car")
      todo_list.add(todo_1)
      expect{ todo_list.add(todo_2) }.to raise_error "error"
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

    it "fails if already marked complete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Wash car")
      todo_list.add(todo_1)
      todo_1.mark_done!
      expect{ todo_1.mark_done! }.to raise_error "Task already marked done."
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

  context "with extended use" do
    it "performs accordingly" do
      todo_list = TodoList.new
      todo_1 = Todo.new("one")
      todo_2 = Todo.new("two")
      todo_3 = Todo.new("three")
      todo_4 = Todo.new("four")
      todo_5 = Todo.new("five")
      todo_6 = Todo.new("one")
      todo_7 = Todo.new("two")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      expect(todo_list.incomplete).to eq [todo_1, todo_2, todo_3]
      todo_2.mark_done!
      todo_3.mark_done!
      expect(todo_list.complete).to eq [todo_2, todo_3]
      todo_list.add(todo_4)
      todo_list.add(todo_5)
      expect(todo_list.incomplete).to eq [todo_1, todo_4, todo_5]
      expect{ todo_list.add(todo_6) }.to raise_error "error"
      todo_5.mark_done!
      todo_list.add(todo_7)
      expect(todo_list.incomplete).to eq [todo_1, todo_4, todo_7]
      expect{ todo_5. mark_done! }.to raise_error "Task already marked done."
      todo_list.give_up!
      expect(todo_list.complete).to eq [todo_2, todo_3, todo_5, todo_1, todo_4, todo_7]
    end
  end
end