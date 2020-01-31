# this assumes certain arguments for isProperSet function and table being a linear array. Can be changed if needed.
def setsOnTable (table)
  numSets = 0
  for i in 0...12
    for j in 0...i
      for k in 0...j
        if (isProperSet(table[i], table[j], table[k]))
          numSets = numSets + 1
      end
    end
  end
  numSets
end
