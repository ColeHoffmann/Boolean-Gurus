class Table
  def initialize
	@currentTable = Array.new
	for i in 0..11
		@currentTable.push Card.drawRandom
	end
  end
end

def putTable(currentTable)
	counter = 0
	for i in 0..2
		for j in 0..3
			puts "#{currentTable[counter].shape}, #{currentTable[counter].color}, #{currentTable[counter].number}, #{currentTable[counter].pattern} "
			counter = counter + 1	
		end
		puts "\n" 
	end
end

