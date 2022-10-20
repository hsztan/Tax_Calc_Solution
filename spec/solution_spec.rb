require './solution.rb'
require 'rspec'

describe 'Sales tax calculator' do
  it 'calculates the total price of items with sales and import taxes' do
    input_1 = [
      '2 book at 12.49',
      '1 music CD at 14.99',
      '1 chocolate bar at 0.85',
    ]
    input_2 = [
      '1 imported box of chocolates at 10.00',
      '1 imported bottle of perfume at 47.50'
    ]
    input_3 = [
      '1 imported bottle of perfume at 27.99',
      '1 bottle of perfume at 18.99',
      '1 packet of headache pills at 9.75',
      '3 imported boxes of chocolates at 11.25'
    ]
    output_1 = <<~HEREDOC   
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.5
Total: 42.32
      HEREDOC
    output_2 = <<~HEREDOC   
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.62
Sales Taxes: 7.63
Total: 65.13
      HEREDOC
    output_3 = <<~HEREDOC   
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.44
Sales Taxes: 7.79
Total: 98.27
      HEREDOC

    expect { calc_total(input_1) }.to output(output_1).to_stdout
    expect { calc_total(input_2) }.to output(output_2).to_stdout
    expect { calc_total(input_3) }.to output(output_3).to_stdout
  end
end