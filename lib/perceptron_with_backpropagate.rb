class Perceptron
  attr_accessor :weights

  def initialize(weights, activation = :step)
    @weights = weights
    @activation = activation
  end
  
  def output(inputs)
    sum = 0
    inputs.each_with_index do |input, i|
      sum += input * @weights[i]
    end
    sum += 1 * @weights.last
    activate(sum)
  end

  def backpropagate(inputs, expected, learning_rate = 0.1)
    error = expected - output(inputs)
    inputs.each_with_index do |input, i|
      @weights[i] = @weights[i] + error * input * learning_rate
    end

    last_index = @weights.count - 1
    @weights[last_index] = @weights[last_index] + error * 1 * learning_rate
  end

  private

  def activate(x)
    return step(x) if @activation == :step
    return sigmoid(x) if @activation == :sigmoid
    return relu(x) if @activation == :relu
    return Math.tanh(x) if @activation == :tanh
    return x
  end

  def step(x)
    return 1 if x > 0
    return 0
  end

  def sigmoid(x)
    1 / (1 + Math.exp(-x))
  end

  def relu(x)
    return x if x > 0
    return 0
  end
end
