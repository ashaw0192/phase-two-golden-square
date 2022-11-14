class TaskTracker
    def initialize
        @task_list = []
    end

    def add_task(text)
        fail "No task was added." if text.empty?
        fail "Task already on list." if @task_list.include?(text.upcase)
        @task_list << text.upcase 
    end

    def show_tasks
        return @task_list
    end

    def mark_complete(text)
        fail "No such task to remove." if !@task_list.include?(text.upcase)
        @task_list.delete(text.upcase)
    end
end