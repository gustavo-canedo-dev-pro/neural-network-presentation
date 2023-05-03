require './lib/perceptron_genetics'
require './lib/neural_network'

def get_neural_child(neural1, neural2)
  child_layers = neural1.layers.map.with_index do |layer, l_i|
    layer.map.with_index do |perceptron, p_i|
      get_child(perceptron, neural2.layers[l_i][p_i])
    end
  end

  return NeuralNetwork.new([], child_layers)
end

def next_neural_generations(population, get_fit, gens)
  gens.times do |i|
    while population.count > 15
      pop1 = population.delete_at(rand(population.length))
      pop2 = population.delete_at(rand(population.length))
  
      best = get_fit.call(pop1) > get_fit.call(pop2) ? pop1 : pop2
      population << best
    end
  
    while population.count < 20
      population << get_neural_child(population.sample, population.sample)
    end
  end
end