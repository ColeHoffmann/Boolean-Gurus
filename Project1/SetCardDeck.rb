class Deck
  def initialize
    @cardDeck = Array.new
    for i in 1..3
      for j in 1..3
        for k in 1..3
          for l in 1..3
            @cardDeck.push(Card.new(i, j, k, l))
          end
        end
      end
    end
    @cardCount = 81
  end
  def cardCount
    @cardCount
  end
  def cardCount=(value)
    @cardCount = value
  end
  def drawRandom
    @cardDeck.delete_at(rand(@cardDeck.length))
  end
end

class Card
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
  def shape
    @shape
  end
  def color
    @color
  end
  def pattern
    @pattern
  end
  def number
    @number
  end
  def string
    "#{@shape}#{@color}#{@pattern}#{number}"
  end
end