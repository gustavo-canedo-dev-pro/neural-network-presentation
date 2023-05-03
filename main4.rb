require './lib/perceptron_genetics'
require './lib/neural_network'
require './lib/neural_genetics'

get_fit = -> (nn) {
  inputs = [
    # *--
    # *--
    # *--
    [1,0,0,  1,0,0,  1,0,0],
    # ---
    # ***
    # ---
    [0,1,0,  0,1,0,  0,1,0],
    [0,0,1,  0,0,1,  0,0,1],

    # ***
    # ---
    # ---
    [1,1,1,  0,0,0,  0,0,0],
    [0,0,0,  1,1,1,  0,0,0],
    [0,0,0,  0,0,0,  1,1,1],

    # *--
    # --*
    # ---
    [1,0,0,  0,0,1,  0,0,0],
    [1,0,0,  0,0,0,  0,0,1],
    [0,1,0,  1,0,0,  0,0,0],
    [0,1,0,  0,0,0,  1,0,0],
    [0,0,1,  0,1,0,  0,0,0],
    [0,0,0,  0,1,0,  1,0,0],

    [1,1,1,  1,1,1,  1,1,1],
    [0,0,0,  0,0,0,  0,0,0],
  ]

  inputs = inputs.map do |input|
    input[rand(input.count)] = 1
    input
  end

  expecteds = [1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0]

  errors = expecteds.map.with_index do |expected, i|
    (nn.output(inputs[i]).first - expected) ** 2
  end

  return 1.0/(1+errors.sum)
}

population = 20.times.map { NeuralNetwork.new([9,8,4,2,1]) }

next_neural_generations(population, get_fit, 1000)
summary(population, get_fit).to_s

nn = summary(population, get_fit)[:best]
nn.output([1,1,1,0,0,0,0,0,0])
