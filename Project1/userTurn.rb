# still requires input validation
# divided into small parts in case we want to change behavior of some of them
# designed so we call turn in a loop, puts current table, then updates score and table

def validIn? (inStr)
  if inStr.to_i == 0
    puts "Invalid input!/n"
    return false
  end
  return true
end

def turn(table, player)
  table.putTable(table.currentTable)
  puts "Please pick your first card or enter \"no sets\" /n"
  s = gets
  until s.equal?("no sets") || validIn?(s)
    puts "Please pick your first card or enter \"no sets\" /n"
    s = gets
  end
  if (s.equal?("no sets"))
    playerClickedNoSets(table, player)
  else
    pickCardsOption(table, player,s.to_i)
  end
end



def pickCardsOption (table, player, firstCard)
  firstCardNum = firstCard
  puts "Please pick your second card /n"
  inStr = gets
  until (validIn?(inStr))
    puts "Please pick your second card /n"
    inStr = gets
  end
  secondCardNum = inStr
  inStr = gets
  puts "Please pick your third card /n"
  until (validIn?(inStr))
    puts "Please pick your third card /n"
    inStr = gets
  end
  thirdCardNum = inStr
  if (isProperSet(table.currentTable[firstCardNum], table.currentTable[secondCardNum], table.currentTable[thirdCardNum]))
    pickedProper(table, player, firstCardNum, secondCardNum, thirdCardNum)
  else 
    pickedImproper(player)
  end  
end

def pickedProper(table, player, firstCardNum, secondCardNum, thirdCardNum)
  player.increase_score
  table.changeCards(table.currentTable[firstCardNum], table.currentTable[secondCardNum], table.currentTable[thirdCardNum])
end

def pickedImproper(player)
  player.decrease_score
  puts "Please try again"
end
