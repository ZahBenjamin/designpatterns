# Chapter 6. Assembling the Whole from the Parts with the Composite

# Component base class
class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

# Leaf classes
class AddDryIngredientsTask < Task
  def initialize(name)
    @name = name
  end

  def get_time_required
    1.0   # 1 Minute to mix dry ingredients
  end
end

class AddLiquids < Task
  def initialize(name)
    @name = name 
  end

  def get_time_required
    1.0  # 1 Minute to mix liquid with dry ingredients
  end
end

class MixTask < Task
  def initialize
    super('Mix that batter up!')
  end

  def get_time_required
    3.0  # 3 Mix for 3 minutes
  end
end

# Composite classes
class MakeBatterTask < Task
  def initialize
    super('Make batter')
    @sub_tasks = []
    add_sub_task( AddDryIngredientsTask.new)
    add_sub_task( AddLiquidsTask.new )
    add_sub_task( MixTask.new )
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    time=0.0
    @sub_tasks.each do {|task| time += task.get_time_required}
    time
  end
end


# UNSuRE WHERE TO GO YET

class MakeCakeTask < CompositeTask
  def initialize
    super('Make cake')
    add_sub_task( MakeBatterTask.new )
    add_sub_task( FillPanTask.new )
    add_sub_task( BakeTask.new )
    add_sub_task( FrostTask.new )
    add_sub_task( LickSpoonTask.new )
  end
end

