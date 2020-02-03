def putCard (card)

  case card.number
  when 1
    puts "   One   "
  when 2
    puts "   Two   "
  when 3
    puts "  Three  "
  else
    puts "ERROR accessing card number!!/n"
  end

  case card.color
  when 1
    puts "   Red   "
  when 2
    puts "  Green  "
  when 3
    puts " Purple  "
  else
    puts "ERROR accessing card color!!/n"
  end

  case card.pattern
  when 1
    puts "  Empty  "
  when 2
    puts " Striped "
  when 3
    puts " Filled  "
  else
    puts "ERROR accessing card pattern!!/n"
  end

  case card.shape
  when 1
    puts "  Oval   "
  when 2
    puts " Square  "
  when 3
    puts " Diamond "
  else
    puts "ERROR accessing card shape!!/n"
  end

  puts "s" unless card.number == 1
  puts "/t"
end
