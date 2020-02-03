#This will be the main code that runs the game of set. 
require "./User.rb"
require "./userTurn.rb"
require "./noSetsOption.rb"
require "./SetCardDeck.rb"
require "./setsOnTable.rb"
require "./TableMechanics.rb"
require "./putCard.rb"

#initial greeting
def greeting
  puts "Welcome to set! How many players will be playing? (1-4)"
  inStr = gets.chomp
  until validIn?(inStr) || inStr.to_i > 4
    inStr = gets.chomp
  end
  playerCount = inStr.to_i
  playerCount
end

def getName
  inStr = gets.chomp
  until inStr.length < 16
    puts "Name too long! Please input less characters."
    inStr = gets.chomp
  end
  until inStr.length > 0
    puts "Please input your name."
    inStr = gets.chomp
  end
  inStr
end

def existName? (name, arrayOfPlayers)
  found = 0
  #increament found if there is a username same as the inputted name
  arrayOfPlayers.each { |player| found += 1 if player.username == name}
  return false if found == 0
  return true
end

#Below is the actual run of program.

#greeting will greet players to the game and return the number of players. 
numPlayers = greeting
arrayOfPlayers = Array.new #create array of players
i = 0
while i < numPlayers
  puts "Player #{i+1}, Please input your name. Shorter is better."
  puts "Because you have to type your name in."
  name = getName
  while existName?(name,arrayOfPlayers)
    puts "Username taken! Please enter a new name"
    name = getName
  end

  arrayOfPlayers[i] = Player.new(name)
	i += 1
end

puts "Welcome to Sets! I will now introduce the basic rule of set"
puts "In this game, there are 12 cards on the table."
puts "Cards have four attributes. Their shape, color, pattern and number"
puts "There are three kind of properties for each attributes of the cards"
puts "For example a card can be \"two red empty oval\" "
puts "If for three cards, they have all the same or all different properties"
puts "Among all of their four attributes, they are called a set"
puts "If you spot a set please call out \"set\" and type your name in"
puts "I will ask which set you spotted and if you got it right,"
puts "you got a point and these three cards are replaced by new cards"
puts "If you were wrong you will be deducted one point and game will continue"
puts "If there is no set on the table please call out \"no set\""
puts "and type your name in, we will check is that true or not"
puts "If you were right then three random cars will be replace and you"
puts "will be reward one point, otherwise, you will be penalize one point"
puts "There are 81 cards total in the deck."
puts "The game will end when there are no cards in the deck and there are"
puts "no sets on the table. The first player correctly called out \"no set\""
puts "will be awarded a point and the game will finish"
puts "The player with the most points will win"
puts "If everyone playing is ready, please press enter"
gets

#game logic in loop

loop do
  deck = Deck.new
  table = Table.new(deck)
  puts "Game start!"
  sleep(1)

  until table.availableSets == 0 && deck.cardCount == 0
    #clear console
    system("cls") || system("clear") || puts("\e[H\e[2J")
    table.putTable
    puts "Remaining cards: #{deck.cardCount}"
    puts "Please type in your name if you found a set / no set"
    name = getName
    until existName?(name, arrayOfPlayers)
        puts "Name not found! Please type again!"
        name = getName
    end
    arrayOfPlayers.each { |player| @currentPlayer = player if player.username == name}
    turn(table,@currentPlayer,deck)
    puts "Clearing in 2 seconds"
    #sleep 2
  end
  #Game set

  highScore = 0
  bestPlayer = arrayOfPlayers[0]
  arrayOfPlayers.each { |player|
    puts "Player #{player.username} have #{player.score} points."
    if player.score > highScore
      bestPlayer = player
      highScore = player.score
    end
  }
  puts "Player #{bestPlayer.username} wins with #{highScore} points!"

  puts "Do you want to play another game (Y/N): "
  break if(gets.chomp.to_s.upcase != "Y")
end 
