
class Player
    attr_accessor :username, :score

    def initialize (name)
      @username = name
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

end
