# need to implement random exchange instead of just drop the first three card
# need to store the current card back into the deck and get new ones and shuffle the deck

def noSetsBehavior (table, player,deck)
  player.increase_score
  if deck.cardCount == 0
    puts "There is no set! We don't have cards left, Game Set!"
  else
    changeCards(table, table.currentTable[0], table.currentTable[1], table.currentTable[2])
    puts "There is no set! Try again with updated table"
  end
end



def playerClickedNoSets(table, player,deck)
  table.availableSets = setsOnTable(table) if table.availableSets == -1
  if table.availableSets == 0
    noSetsBehavior(table, player,deck)
  else 
    puts "Sorry, there is a proper set on the table. Please try again "
    player.decrease_score
  end
end
  
