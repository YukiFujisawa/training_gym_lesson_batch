class Lesson
  attr_reader :time, :program, :instructor

  def initialize(time, program, instructor)
    @time = time
    @program = program
    @instructor = instructor
  end
end