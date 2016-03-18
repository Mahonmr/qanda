class Event < ActiveRecord::Base
  belongs_to :event_type

  attr_writer :current_step

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[type name_date address confirm]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
end
