def roman_to_int(s)
  roman_values = {
    'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000
  }
  
  total = 0
  previous_value = 0
  
  s.reverse.each_char do |char|
    current_value = roman_values[char]
    
    if current_value < previous_value
      total -= current_value
    else
      total += current_value
    end
    
    previous_value = current_value
  end
  
  total
end

def int_to_roman(num)
  values = [
    [1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'],
    [100, 'C'], [90, 'XC'], [50, 'L'], [40, 'XL'],
    [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I']
  ]
  
  result = ""
  values.each do |value, symbol|
    while num >= value
      result << symbol
      num -= value
    end
  end
  
  result
end

puts "Enter a Roman numeral or an integer:"
input = gets.chomp.upcase

if input.match?(/^\d+$/) # Check if input is an integer
  number = input.to_i
  if number.between?(1, 3999)
    puts "Roman numeral: #{int_to_roman(number)}"
  else
    puts "Number out of allowed range (1-3999)"
  end
elsif input.match?(/^[IVXLCDM]+$/) # Check if input is a valid Roman numeral
  puts "Integer: #{roman_to_int(input)}"
else
  puts "Invalid input!"
end
