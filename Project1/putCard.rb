def putCard (card)

  case card.number
  when 1
    print "   One   "
  when 2
    print "   Two   "
  when 3
    print "  Three  "
  else
    puts "ERROR accessing card number!!"
  end

  case card.color
  when 1
    print "   Red   "
  when 2
    print "  Green  "
  when 3
    print " Purple  "
  else
    puts "ERROR accessing card color!!"
  end

  case card.pattern
  when 1
    print "  Empty  "
  when 2
    print " Striped "
  when 3
    print " Filled  "
  else
    puts "ERROR accessing card pattern!!"
  end

  case card.shape
  when 1
    print "  Oval   "
  when 2
    print " Square  "
  when 3
    print " Diamond "
  else
    puts "ERROR accessing card shape!!"
  end

  puts ""
end
