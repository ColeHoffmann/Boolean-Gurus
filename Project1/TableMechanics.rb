class Table
  def initialize
	@table = Array.new
	for i in 0..11
		table.push Card.drawRandom
	end
  end

  def putTable
	@table = Table.new
	@counter = 0
	for i in 0..2
		for j in 0..3
			puts "#{table[counter].shape}, #{table[counter].color}, #{table[counter].number}, #{table[counter].pattern} "
			counter++	
		end
		puts "\n"
	end
  end
end
