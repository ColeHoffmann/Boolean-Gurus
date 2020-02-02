# still requires input validation
# divided into small parts in case we want to change behavior of some of them
# designed so we call turn in a loop, puts current table, then updates score and table

def turn(table, player)
  table.putTable(table.currentTable)
  puts "Please pick your first card or enter no sets /n"
  s = gets
  if (s.equal?("no sets")
      noSetsOption(table, player)
  else 
      pickCardsOption(table, player)
  end
end

def pickCardsOption (table, player)
  firstCardNum = s.to_i
  puts "Please pick your second card /n"
  secondCardNum = gets.to_i
  puts "Please pick your third card /n"
  thirdCardNum = gets.to_i
  if (isProperSet(table.currentTable[firstCardNum], table.currentTable[secondCardNum], table.currentTable[thirdCardNum])
    pickedProper(table, player, firstCardNum, secondCardNum, thirdCardNum)
  else 
    pickedUnproper(player)
  end  
end

def pickedProper(table, player, firstCardNum, secondCardNum, thirdCardNum)
  player.increase_score
  table.changeCards(table.currentTable[firstCardNum], table.currentTable[secondCardNum], table.currentTable[thirdCardNum])
end

def pickedUnproper(player)
  player.decrease_score
  puts "Please try again"
end
