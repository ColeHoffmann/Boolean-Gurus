class Deck
  attr_accessor :cardCount
  def initialize
    @cardDeck = Array.new
    (1..3).each { |i|
      (1..3).each { |j|
        (1..3).each { |k|
          (1..3).each { |l|
            @cardDeck.push(Card.initialize(i, j, k, l))
          }
        }
      }
    }
    @cardCount = 81
    # shuffle the deck
    @cardDeck.shuffle!
  end
  #Draws random card and decrements cardCount
  def drawRandom
    @cardCount = @cardCount - 1
    return @cardDeck.pop
  end
end

class Card
  attr_reader :shape, :color, :pattern, :number
  def initialize(shape, color, pattern, number)
    #Shapes: 1 = Oval, 2 = Square, 3 = Diamond
    @shape = shape

    #Colors: 1 = Red, 2 = Green, 2 = Purple
    @color = color

    #Pattern: 1 = Empty, 2= Striped, 3 = Filled
    @pattern = pattern

    #Number: 1 = 1, 2 = 2, 3 = 3
    @number = number
  end
  def string
    "#{@shape}#{@color}#{@pattern}#{@number}"
  end
end