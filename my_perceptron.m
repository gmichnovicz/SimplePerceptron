function output = my_perceptron(input1, input2, w1, w2, theta)
%function adapted from Mark Kramer, BU.

  % Define the activity of the neuron, x.
  x = input1*w1 + input2*w2 + theta;
  
  % Apply the binary threshold,
  if x > 0
      output = 1;
  else
      output = 0;
  end
  
end
