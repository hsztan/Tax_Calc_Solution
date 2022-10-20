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