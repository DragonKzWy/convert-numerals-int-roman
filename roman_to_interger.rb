def roman_to_int(s)
  valores_romanos = {
    'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000
  }
  
  total = 0
  valor_anterior = 0
  
  s.reverse.each_char do |char|
    valor_atual = valores_romanos[char]
    
    if valor_atual < valor_anterior
      total -= valor_atual
    else
      total += valor_atual
    end
    
    valor_anterior = valor_atual
  end
  
  total
end

def int_to_roman(num)
  valores = [
    [1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'],
    [100, 'C'], [90, 'XC'], [50, 'L'], [40, 'XL'],
    [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I']
  ]
  
  resultado = ""
  valores.each do |valor, simbolo|
    while num >= valor
      resultado << simbolo
      num -= valor
    end
  end
  
  resultado
end

puts "Digite um número em algarismos romanos ou um número inteiro:"
entrada = gets.chomp.upcase

if entrada.match?(/^\d+$/) # Verifica se a entrada é um número inteiro
  numero = entrada.to_i
  if numero.between?(1, 3999)
    puts "Número romano: #{int_to_roman(numero)}"
  else
    puts "Número fora do intervalo permitido (1-3999)"
  end
elsif entrada.match?(/^[IVXLCDM]+$/) # Verifica se a entrada é um número romano válido
  puts "Número inteiro: #{roman_to_int(entrada)}"
else
  puts "Entrada inválida!"
end
