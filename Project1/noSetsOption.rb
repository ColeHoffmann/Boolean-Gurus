# currently access private class variable currentTable
# noSetsBehavior will be changed

def noSetsBehavior (table, player)
  player.increaseScore
  changeCards(table, table.currentTable[0], table.currentTable[1], table.currentTable[2])
  table.putTable(table.currentTable)
  puts "Try again with updated table"

end



def playerClickedNoSets (table, player)
  if (setsOnTable(table) == 0) 
    noSetsBehavior (table, player)
  else 
    puts "Sorry, there is a proper set on the table. Please try again /n"
    player.decreaseScore
  end
end
  
