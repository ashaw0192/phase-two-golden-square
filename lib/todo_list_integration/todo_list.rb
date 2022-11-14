class TodoList
  def initialize
    @incomplete = []
    @complete = []
  end

  def add(todo) 
    @todo = todo
    @incomplete << todo
  end

  def incomplete
    format
    @incomplete
  end

  def complete
    format
    @complete
  end

  def give_up!
    @complete += @incomplete
    @incomplete = []
  end

  def format
    @incomplete.each { |task| @complete << task if task.done? }
    @incomplete -= @complete
  end
end
