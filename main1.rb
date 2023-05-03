require './lib/perceptron'

perceptron_and = Perceptron.new([0.9, 0.9, -1.75], :step)

perceptron_and.output([0,0]) # 0 * 0.9 + 0 * 0.9 - 1.75 = -1.75 => 0
perceptron_and.output([0,1]) # 0 * 0.9 + 1 * 0.9 - 1.75 = -0.85 => 0
perceptron_and.output([1,0]) # 1 * 0.9 + 0 * 0.9 - 1.75 = -0.85 => 0
perceptron_and.output([1,1]) # 1 * 0.9 + 1 * 0.9 - 1.75 =  0.15 => 1


perceptron_or = Perceptron.new([0.5, 0.5, -0.1], :step)

perceptron_or.output([0,0]) # => 0
perceptron_or.output([0,1]) # => 1
perceptron_or.output([1,0]) # => 1
perceptron_or.output([1,1]) # => 1