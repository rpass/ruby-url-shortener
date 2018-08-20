class Example
  def initialize(thought)
    @thought = thought
  end

  def speak
    @thought.to_s
  end
end
