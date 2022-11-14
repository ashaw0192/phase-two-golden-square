# RECIPE FOR TASK TRACKER

## 1. Describe the problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the class interface

    ruby
class TaskTracker
    def initialize
        # ... 
    end

    def add_task(text) # text is a string containing a class to add
        #returns nothing
        #fails if task empty
        #fails if task already on list
    end

    def show_tasks
        # returns an upcase list of tasks to complete
    end

    mark_complete(text) #text is a string containing the task to remove from list
        # returns nothing
        # fails if task doesnt exist on list
    end
end

# 3. Create examples as Tests

    ruby
* 1
task_tracker = TaskTracker.new
task_tracker.show_tasks 
# => []

* 2
task_tracker = TaskTracker.new
task_tracker.add_task("")
# error ("No task was added.")

* 3
task_tracker = TaskTracker.new
task_tracker.add_task("Walk_dog")
task.tracker.show_tasks
# => ["Walk dog"]

* 4
task_tracker = TaskTracker.new
task_tracker.add_task("Walk_dog")
task_tracker.add_task("Water plants")
task_tracker.show_tasks
# => ["walk dog", "water plants"]

* 5
task_tracker = TaskTracker.new
task_tracker.add_task("Walk_dog")
task_tracker.add_task("Walk_dog")
# error ("Task already on list.")

* 6
task_tracker = TaskTracker.new
task_tracker.remove_task("Walk_dog")
# error ("No such task to remove.")

* 7
task_tracker = TaskTracker.new
task_tracker.add_task("Walk_dog")
task_tracker.add_task("Water plants")
task_tracker.remove_task("Walk dog")
task_tracker.show_tasks
# => ["water plants"]

## 4. Implement the Behaviour