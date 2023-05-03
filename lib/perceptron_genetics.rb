require './lib/perceptron'

def get_child(perceptron1, perceptron2)
  child_weights = perceptron1.weights.map.with_index do |w1, i|
    w2 = perceptron2.weights[i]

    wmin = [w1,w2].min
    wmax = [w1,w2].max

    rand((wmin-0.1)..(wmax+0.1))
  end

  return Perceptron.new(child_weights, perceptron1.activation)
end

def summary(population, get_fit)
  best_pop = population.first
  best_fit = get_fit.call(population.first)
  fit_sum = 0
  population.each do |pop|
    pop_fit = get_fit.call(pop)
    fit_sum += pop_fit
    if(pop_fit > best_fit)
      best_pop = pop
      best_fit = pop_fit
    end
  end

  return {
    best: best_pop,
    best_fit: best_fit,
    average: fit_sum/population.count
  }
end

def next_generations(population, get_fit, gens)
  gens.times do |i|
    while population.count > 15
      pop1 = population.delete_at(rand(population.length))
      pop2 = population.delete_at(rand(population.length))
  
      best = get_fit.call(pop1) > get_fit.call(pop2) ? pop1 : pop2
      population << best
    end
  
    while population.count < 20
      population << get_child(population.sample, population.sample)
    end
  end
end