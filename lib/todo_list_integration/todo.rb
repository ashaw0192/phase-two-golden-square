class Todo
  def initialize(task)
    @task = task
    @hash = {}
    @hash[@task] = :incomplete
  end

  def task
    @task
  end

  def mark_done!
    #!@task.include?("***COMPLETE***") ? @task << " ***COMPLETE***" : raise("Task already marked done.")
    @hash[@task] == (:complete) ? raise("Task already marked done.") : (@hash[@task] = :complete)
  end

  def done?
    @hash[@task] == :complete ? true : false
  end
end