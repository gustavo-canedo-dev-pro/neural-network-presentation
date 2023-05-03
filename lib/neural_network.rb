require './lib/perceptron'

class NeuralNetwork
  attr_accessor :layers
  def initialize(layers_summary, set_layers = nil, activation = :sigmoid)
    if(set_layers)
      @layers = set_layers
      return
    end

    last_layer_length = layers_summary.first

    @layers = layers_summary.drop(1).map.with_index do |layer_length|
      layer = layer_length.times.map {Perceptron.new((last_layer_length+1).times.map { rand(-2.0..2.0) }, activation)}
      last_layer_length = layer_length
      layer
    end
  end
  
  def output(inputs)
    layer_input = inputs

    @layers.each do |layer|
      layer_input = layer.map do |perceptron|
        perceptron.output(layer_input)
      end
    end

    return layer_input
  end
end
