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


  

  def changeChards(card1, card2, card3)
  end
    

 
end
