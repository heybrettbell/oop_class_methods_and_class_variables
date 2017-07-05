class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3


  def initialize(speed, strength)
    @speed = speed
    @strength = strength
    if @speed > @@max_speed
      @speed = @@default_speed
    end
    if @strength > @@max_strength
      @strength = @@default_strength
    end
  end

  def encounter # <--- returning error
    if outrun_zombie? == true
      puts "You outran a zombie!"
    else
      if survive_attack? == true
        @@horde << Zombie.new(rand(0..@@default_speed), rand(0..@@default_strength))
        puts "Sorry..you are now a zombie!"
      else
        puts "You died.  Sad!"
      end
    end
  end

  def outrun_zombie?
    how_fast = rand(0..@@max_speed)
    p Zombie.speed
    if how_fast > Zombie.speed
     true
   elsif how_fast <= Zombie.speed
     false
   end
  end

  def survive_attack?
    my_strength = rand(0..@@max_speed)
    if my_strength > Zombie.default_strength
      true
    else
      false
    end
  end

  def self.all
    return @@horde
  end

  def self.new_day
    some_die_off
    spawn
    increase_plague_level
  end

  def self.some_die_off
    die = rand(0..10)
    @@horde.pop(die)
  end

  def self.spawn
    new_batch = rand(0..@@plague_level)
    if new_batch >= 1
      new_batch.times do
        @@horde << Zombie.new(rand(00..@@max_speed), rand(0..@@max_strength))
      end
    end
  end

  def self.increase_plague_level
    level = rand(0..2)
    @@plague_level += level
  end
end

puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
