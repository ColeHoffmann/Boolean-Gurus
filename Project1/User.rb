require 'set'

class Player
    @@num = 1
    @@hotkeySet = Set.new
    attr_accessor :username, :score, :hotkey

    def initialize
      @username = "Player ".concat(@@num.to_s)
      @@num += 1
      @score = 0
    end

    def increase_score
        @score += 1
    end

    def decrease_score
        if @score != 0
            @score -= 1
        end
    end

    def addHotkey(char)
        #add hotkey and check for duplicates
        if @@hotkeySet.include?(char)
            puts "Hotkey #{char} already taken."
        else 
            @hotkey = char
            @@hotkeySet << char
        end
    end

    def viewHotkeySet
        puts @@hotkeySet
    end
end
