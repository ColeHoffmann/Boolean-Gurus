require "./noSetsOption.rb"
require "./setsOnTable.rb"
# divided into small parts in case we want to change behavior of some of them
# designed so we call turn in a loop, puts current table, then updates score and table

def validIn? (inStr)
  if inStr.to_i == 0
    puts "Invalid input!"
    return false
  end
  return true
end

def turn(table, player, deck)
  #clear console
  system("cls") || system("clear") || puts("\e[H\e[2J")

  table.putTable
  puts "Please pick your first card or enter \"no sets\" "
  s = gets.chomp
  until s == "no sets" || validIn?(s)
    puts "Please pick your first card or enter \"no sets\" "
    s = gets.chomp
  end
  if (s == "no sets")
    playerClickedNoSets(table, player,deck)
  else
    pickCardsOption(table, player,s.to_i,deck)
  end
end

def pickCardsOption (table, player, firstCard,deck)
  firstCardNum = firstCard - 1

  puts "Please pick your second card"
  inStr = gets.chomp
  until (validIn?(inStr))
    puts "Please pick your second card"
    inStr = gets.chomp
  end
  secondCardNum = inStr.to_i - 1

  puts "Please pick your third card"
  inStr = gets.chomp
  until (validIn?(inStr))
    puts "Please pick your third card"
    inStr = gets.chomp
  end
  thirdCardNum = inStr.to_i - 1

  if (isProperSet(table.currentTable[firstCardNum], table.currentTable[secondCardNum], table.currentTable[thirdCardNum]))
    pickedProper(table, player, firstCardNum, secondCardNum, thirdCardNum, deck)
  else 
    pickedImproper(player)
  end  
end

def pickedProper(table, player, firstCardNum, secondCardNum, thirdCardNum,deck)
  puts "You are right! Your score now is #{player.score}"
  player.increase_score
  if (deck.cardCount > 0 )
    table.changeCards(table.currentTable[firstCardNum], table.currentTable[secondCardNum], table.currentTable[thirdCardNum],deck)
  end
end

def pickedImproper(player)
  player.decrease_score
  puts "Wrong! Please try again. Your score now is #{player.score}"
end
