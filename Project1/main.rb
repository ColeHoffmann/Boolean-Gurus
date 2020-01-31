#This will be the main code that runs the game of set. 
require "./User.rb"

#initial greeting
def greeting()
  puts "Welcome to set! How many players will be  playing? (1-4)\n"
  playerCount = gets.to_i

  until( (playerCount== 1) || (playerCount== 2) || (playerCount ==3) || (playerCount ==4))
    puts "Invalid Responce. Please choose (1/2/3/4)\n"
    playerCount = gets.to_i
  end
  playerCount
end




#Below is the actual run of program.

#greeting will greet players to the game and return the number of players. 
numPlayers = greeting
arrayOfPlayers = Array.new #create array of players
i = 0
while i < numPlayers
	arrayOfPlayers[i] = Player.new()
	puts "#{arrayOfPlayers[i].username}, please input your hotkey: "
	arrayOfPlayers[i].addHotkey(gets.to_s)
	i += 1
end

#game logic in loop

while true



	

end 
