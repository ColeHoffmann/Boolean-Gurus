class Table
  def initialize
	@table = Array.new
	for i in 0..11
		@table.push Card.drawRandom
	end
  end
end

def putTable
	@currentTable = Table.new
	@counter = 0
	for i in 0..2
		for j in 0..3
			puts "#{@currentTable[@counter].shape}, #{@currentTable[@counter].color}, #{@currentTable[@counter].number}, #{@currentTable[@counter].pattern} "
			@counter = @counter + 1	
		end
		puts "\n" 
	end
  end


  
  #These values should be THE SPOT IN THE ARRAY IN WHICH THE CARD RESIDES - "The i value" 
  #For example, if cards array[3] array[6] and array[0] gets picked, the parameters would be 3, 6, and 0
  def changeChards(currentTable, card1, card2, card3)
    currentTable[card1] = Card.drawRandom
    currentTable[card2] = Card.drawRandom
    currentTable[card3] = Card.drawRandom
  end
    

 
end
