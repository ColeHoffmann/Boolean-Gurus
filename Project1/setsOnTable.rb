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
