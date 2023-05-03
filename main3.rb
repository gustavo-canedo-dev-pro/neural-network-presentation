require './lib/perceptron'
require './lib/perceptron_genetics'

get_fit = -> (perceptron) {
  inputs = [
    [0,0],
    [0,1],
    [1,0],
    [1,1],
  ]

  expected = [0, 1, 1, 1]

  errors = expected.map.with_index do |expected, i|
    (perceptron.output(inputs[i]) - expected) ** 2
  end

  return 1.0/(1+errors.sum)
}

population = 20.times.map {Perceptron.new(3.times.map { rand(-2.0..2.0) }, :sigmoid)}
next_generations(population, get_fit, 100)
summary(population, get_fit).to_s