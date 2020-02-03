class Table
  def initialize
	@currentTable = Array.new
	(0..11).each { |i|
		@currentTable.push Card.drawRandom
	}
  end
end

def putTable(currentTable)
	counter = 0
	(0..2).each { |i|
		(0..3).each { |j|
			puts "#{currentTable[counter].shape}, #{currentTable[counter].color}, #{currentTable[counter].number}, #{currentTable[counter].pattern} "
			counter = counter + 1
		}
		puts "\n"
	}
  end


  
  #These values should be THE SPOT IN THE ARRAY IN WHICH THE CARD RESIDES - "The i value" 
  #For example, if cards array[3] array[6] and array[0] gets picked, the parameters would be 3, 6, and 0
  def changeCards(currentTable, card1, card2, card3)
    currentTable[card1] = Card.drawRandom
    currentTable[card2] = Card.drawRandom
    currentTable[card3] = Card.drawRandom
	end


