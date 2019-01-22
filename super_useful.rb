# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    puts "Encountered an error please enter a valid number"
    return nil
  end
end

class CoffeeError < StandardError
  def message
    puts "Mmmm I love coffee!! Have another try!!"
  end
end

class NotFruitError < StandardError
  def message
    puts "Thats not a fruit!"
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise NotFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError, NotFruitError => e
    puts e.message
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.length < 1 || fav_pastime.length < 1
      if name.length < 1
        raise EmptyName
      else
        raise NoPastTime
      end
    end
    if yrs_known < 5
      raise NotBestFriend
    else
      @yrs_known = yrs_known
    end
    @name = name
    @fav_pastime = fav_pastime
  end

  class NotBestFriend < StandardError
    def message
      puts "You must be friends for at least 5 years to truly be best friends"
    end
  end
  class EmptyName < StandardError
    def message
      puts "You must give your name!" 
    end
  end
  class NoPastTime < StandardError
    def message
      puts "You must put your favorite pastime!"
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end
