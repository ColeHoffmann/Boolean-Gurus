# this assumes certain arguments for isProperSet function and table being a linear array. Can be changed if needed.
# currently I access class variable currentTable directly, which is impossible since it is private. Need an accessor function
def setsOnTable (table)
  numSets = 0
  for i in 0...12
    for j in 0...i
      for k in 0...j
        if (isProperSet(table.currentTable[i], table.currentTable[j], table.currentTable[k]))
          numSets = numSets + 1
        end
      end
    end
  end
  numSets
end



#this will return true if the three cards form a proper set and false if they do not. 
def isProperSet(card1, card2, card3)
  #the attributes follow the convention if the sum is 3,6, or 9, due to the way we implemented card. If not, it is false. 
  valid = Array[3,6,9]
  #we will assume it is proper set, we will then go through and check each attribute to make sure it follows the rule. 
  isProperSet = true;


  #unless the sum of color is contained in the valid array, make this attrubute is false.. 
  #all other attributes follow this convention
  unless (valid.include?(card1.color + card2.color + card3.color))
    isProperSet = false
  end
  
  unless (valid.include?(card1.shape + card2.shape + card3.shape))
    isProperSet = false
  end 

  unless (valid.include?(card1.pattern + card2.pattern + card3.pattern))
    isProperSet = false
  end

  unless (valid.include?(card1.number + card2.number + card3.number))
    isProperSet = false
  end

  #if any one of the sums is not 3, 6, or 9. Proper set will return false. 
  #return:
  isProperSet
end
