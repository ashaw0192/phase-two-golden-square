require "task_tracker_design"

RSpec.describe TaskTracker do
    context "when asking tracker to list tasks and none have been added" do
        it "returns an empty list" do
            task_tracker = TaskTracker.new
            result = task_tracker.show_tasks
            expect(result).to eq []
        end
    end

    context "when trying to add a task consisting of an empty string" do
        it "fails" do
            task_tracker = TaskTracker.new
            expect{ task_tracker.add_task("") }.to raise_error "No task was added."
        end
    end

    context "when adding a task and then asking for list" do
        it "returns list containing just task" do
            task_tracker = TaskTracker.new
            task_tracker.add_task("Walk dog")
            expect(task_tracker.show_tasks).to eq ["WALK DOG"]
        end
    end

    context "when adding two tasks and then asking for list" do
        it "returns list containing the two tasks" do
            task_tracker = TaskTracker.new
            task_tracker.add_task("Walk dog")
            task_tracker.add_task("Water plants")
            expect(task_tracker.show_tasks).to eq ["WALK DOG", "WATER PLANTS"]
        end
    end

    context "when adding the same task twice" do
        it "fails" do
            task_tracker = TaskTracker.new
            task_tracker.add_task("Walk dog")
            expect{ task_tracker.add_task("Walk dog") }.to raise_error "Task already on list."
        end
    end

    context "when asked to remove a task that isnt on the list" do
        it "fails" do
            task_tracker = TaskTracker.new
            expect{ task_tracker.mark_complete("Walk dog") }.to raise_error "No such task to remove."
        end
    end

    context "when adding multiple tasks, removing one and calling list" do
        it "returns list containing just task uncompleted" do
            task_tracker = TaskTracker.new
            task_tracker.add_task("Walk dog")
            task_tracker.add_task("Water plants")
            task_tracker.mark_complete("Walk dog")
            expect(task_tracker.show_tasks).to eq ["WATER PLANTS"]
        end
    end
end