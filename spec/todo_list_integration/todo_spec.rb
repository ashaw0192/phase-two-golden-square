require './lib/todo_list_integration/todo'

RSpec.describe Todo do
  context "when initialized" do
    it "constructs" do
      expect(Todo.new("Wash car")).to be_an_instance_of(Todo)
    end
  end

  context "when task is called" do
    it "returns task as a string" do
      todo = Todo.new("Wash car")
      expect(todo.task).to eq "Wash car"
    end
  end

  context "mark done called on task twice" do
    it "fails" do
      todo = Todo.new("Wash car")
      todo.mark_done!
      expect{ todo.mark_done! }.to raise_error "Task already marked done."
    end
  end

  context "if done? is called" do
    it "returns false if task incomplete" do
      todo = Todo.new("Wash car")
      expect(todo.done?).to eq false
    end

    it "returns true if task complete" do
      todo = Todo.new("Wash car")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end
end