WINNING_LINES = [[1,2,3], [4,5,"a"], [7,8,9], [1,4,7], [2,5,8], [3,"a",9], [1,5,9], [3,5,7]]

SPACES = {1 => 1, 2 => 2, 3 => "X", 4 => "X", 5 => "X", "a" => 6, 7 => 7, 8 => 8, 9 => 9}

def check_two (spaces)
    choices = nil
    WINNING_LINES.each do |line|
    	if spaces.values_at(*line).count("X") == 2
    		choices = spaces.values_at(*line).select{|v| v.is_a? Numeric}.first
    		break
    	elsif spaces.values_at(*line).count("O") == 2
    		choices = spaces.values_at(*line).select{|v| v.is_a? Numeric}.first
            break
    	end
    end
    return choices
end

puts check_two(SPACES)
