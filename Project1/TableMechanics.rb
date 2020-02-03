require "./putCard.rb"
class Table
	# availableSets attribute is for caching the costly find available sets operation
	# -1 means not calculated 0 or more indicates the available sets
	attr_accessor :availableSets, :currentTable
  def initialize (deck)
	@currentTable = Array.new
	(0..11).each { |i|
		@currentTable.push deck.drawRandom
	}
	@availableSets = -1
	end
	def putTable
		counter = 0
		(0...@currentTable.length).each { |i|
				print "#{counter+1} ".ljust(3)
				putCard(@currentTable[counter])
				counter += 1
		}
	end
	#These values should be THE SPOT IN THE ARRAY IN WHICH THE CARD RESIDES - "The i value"
	#For example, if cards array[3] array[6] and array[0] gets picked, the parameters would be 3, 6, and 0
	def changeCards( card1, card2, card3, deck)
		@currentTable[card1] = deck.drawRandom
		@currentTable[card2] = deck.drawRandom
		@currentTable[card3] = deck.drawRandom
		@availableSets = -1
	end

	def removeCards( card1, card2, card3)
		@currentTable.delete_at(card1)
		@currentTable.delete_at(card2)
		@currentTable.delete_at(card3)
		@availableSets = -1
	end

end


