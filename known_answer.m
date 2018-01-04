function desired_output = known_answer(slope, intercept, x, y)
%function adapted from Mark Kramer, BU.

  yline = slope*x + intercept;  %Compute y-value on the line.
  if y > yline                  %If the input y value is above the line,
      desired_output = 1;       %... indicate this with output = 1;
  else                          %Otherwise, the input y is below the line,
      desired_output = 0;
  end
  
end
