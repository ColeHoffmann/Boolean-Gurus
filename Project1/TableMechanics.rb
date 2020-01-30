class Table
  def initialize
	@table = Array.new
	for i in 1..3
		@tableRow = Array.new
		for j in 1..4
			@tableRow.push(Card.drawRandom)
		end
		@table.push(@tableRow)
	end
  end
end
