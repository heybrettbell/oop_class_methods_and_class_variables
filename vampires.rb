class Vampire
  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.sunrise
    if @drank_blood_today == false
      @@coven.delete(self)
    elsif @in_coffin == false
      @@coven.delete(self)
    end
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.drink_blood = false
      vampire.go_home = false
    end
  end

  def go_home
    @in_coffin = true
  end


end
