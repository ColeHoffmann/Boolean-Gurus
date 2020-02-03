# this assumes certain arguments for isProperSet function and table being a linear array. Can be changed if needed.
# currently I access class variable currentTable directly, which is impossible since it is private. Need an accessor function
def setsOnTable (table)
  numSets = 0
  (0...12).each { |i|
    (0...i).each { |j|
      (0...j).each { |k|
        if (isProperSet(table.currentTable[i], table.currentTable[j], table.currentTable[k]))
          numSets = numSets + 1
        end
      }
    }
  }
  numSets
end



#This method will take in 3 card objects and will return true if the cards make up a proper set, and false if not. Due to our implementation inside card, we can calulcate the sums of the card attributes and verify if it is proper or not. 
# @ensures: true if hand is proper set, false if not
# @requires: card1, card2, and card3 are all card objects
def isProperSet(card1, card2, card3)
  valid = Array[3,6,9]
  #we will assume it is proper set, we will then go through and check each attribute to make sure it follows the rule. 
  properSet = true;


  #unless the sum of color is contained in the valid array, make this attrubute is false.. 
  #all other attributes follow this convention
  unless (valid.include?(card1.color + card2.color + card3.color))
    properSet = false
  end
  
  unless (valid.include?(card1.shape + card2.shape + card3.shape))
    properSet = false
  end 

  unless (valid.include?(card1.pattern + card2.pattern + card3.pattern))
    properSet = false
  end

  unless (valid.include?(card1.number + card2.number + card3.number))
    properSet = false
  end

  #if any one of the sums is not 3, 6, or 9. Proper set will return false. 
  #return:
  properSet
end
