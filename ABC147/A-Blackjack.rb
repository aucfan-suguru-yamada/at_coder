puts gets.chomp.split(' ').sum(&:to_i) > 21 ? 'bust' : 'win'