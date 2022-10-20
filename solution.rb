require 'rspec'

def calc_total(lines)
  return if lines.empty?

  reg_tax = 0.1
  imp_tax = 0.05
  
  global_tax = 0.0
  global_total = 0.0
  
  lines.each do |line|
    total = 0.0
    total_taxable = 0.0
    splitted = line.split
    sum = (splitted.first.to_f * splitted.last.to_f)
    tax = 0.0
    total_item = 0.0
    if line =~ /book|chocolate|pill/
      total += sum
    else
      tax = (sum * reg_tax)
      total_taxable += tax
      total += (sum + tax)
    end
    if line =~ /imported/
      tax = sum * imp_tax
      total_taxable += tax
      total += tax
    end
    puts "#{splitted[0..-3].join(' ')}: #{sprintf('%.2f', total)}"

    global_tax += total_taxable
    global_total += total
  end
  puts 'Sales Taxes: ' + global_tax.round(2).to_s
  puts 'Total: ' + global_total.round(2).to_s
end


lines_1 = [
  '2 book at 12.49',
  '1 music CD at 14.99',
  '1 chocolate bar at 0.85',
]
lines_2 = [
  '1 imported box of chocolates at 10.00',
  '1 imported bottle of perfume at 47.50'
]
lines_3 = [
  '1 imported bottle of perfume at 27.99',
  '1 bottle of perfume at 18.99',
  '1 packet of headache pills at 9.75',
  '3 imported boxes of chocolates at 11.25'
]

puts calc_total(lines_1)
puts '-----------------'
puts calc_total(lines_2)
puts '-----------------'
puts calc_total(lines_3)
puts '-----------------'