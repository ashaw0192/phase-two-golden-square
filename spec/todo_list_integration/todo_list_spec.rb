require './lib/todo_list_integration/todo_list'

RSpec.describe TodoList do
  context "initially" do
    it "constructs" do
      expect(TodoList.new).to be_an_instance_of(TodoList)
    end
  end

  context "initially, when no tasks have been added" do
    it "returns an empty list under incomplete" do
      todo_list = TodoList.new
      expect(todo_list.incomplete).to eq []
    end
  end

  context "when no tasks have been completed" do
    it "returns an empty list under complete" do
      todo_list = TodoList.new
      expect(todo_list.complete).to eq []
    end
  end
end
