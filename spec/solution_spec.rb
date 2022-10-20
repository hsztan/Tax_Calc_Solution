require '../solution.rb'
require 'rspec'

describe 'Sales tax calculator' do
  it 'calculates the total price of items with sales and import taxes' do
    lines = [
      '2 book at 12.49',
      '1 music CD at 14.99',
      '1 chocolate bar at 0.85',
    ]
    output = <<~HEREDOC   
      1 book: 12.49
      1 music CD: 16.49
      1 chocolate bar: 0.85
      Sales Taxes: 1.50
      Total: 29.83
      HEREDOC

    expect { calc_total(lines) }.to output(output).to_stdout
  end
end