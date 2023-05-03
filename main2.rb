require './lib/perceptron_with_backpropagate'
random_weights = 3.times.map { rand(-2.0..2.0) }
perceptron = Perceptron.new(random_weights, :step)

100.times do
  perceptron.backpropagate([0,0], 0)
  perceptron.backpropagate([0,1], 0)
  perceptron.backpropagate([1,0], 0)
  perceptron.backpropagate([1,1], 1)
end

perceptron

perceptron.output([0,1])