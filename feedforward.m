function output = feedforward(x, y, wx, wy, wb)
%function adapted from Mark Kramer, BU.
  % Fix the bias.
  bias = 1;

  % Define the activity of the neuron, activity.
  activity = x*wx + y*wy + wb*bias;
  
  % Apply the binary threshold,
  if activity > 0
      output = 1;
  else
      output = 0;
  end
  
end
