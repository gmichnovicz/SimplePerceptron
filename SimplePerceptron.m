%%  Lab 9:  Building and training a perceptron. - Adapted from Mark Kramer, Boston University
%   In this lab, we will construct simple perceptron models. You will be
%   implementing a perceptron model, and seeing how it behaves.


%%  Part 1.  A simple perceptron model.  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   In class, we discussed the perceptron, and how the perceptron accepts
%   inputs, processes those inputs, and returns an output.
%
%   Function to acheive this - my_perceptron.m
%
%%  Part 2.  Build a perceptron classifier.  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   In lecture, we discussed a method to train a perceptron to classify a
%   point (x,y) as above or below a line. In this part of the lab, you will
%   implement this training procedure.

%%  Step 1. Provide perceptron with inputs and known answer. %%%%%%%%%%%%%%

%   First, let's make a function that computes a line, and determines if 
%   a given y value is above or below the line. We'll use this function
%   to return the correct ("known") answer. Having known answers is
%   important for training the perceptron. We'll use the known answers to
%   tell the when it's right or wrong (i.e., when the perceptron makes an
%   error).

%   Let's define the function ("known_answer.m") should take four inputs:
%
%   1) slope, 2) intercept, 3) x, 4) y
%
%   where the (x,y) value is a point we choose on the plane. The function
%   should return one output:
%
%   1) desired_output
%
%   where,
%
%   desired_output = 1, if yvalue (the last input) is above the line,
%   desired_putput = 0, if yvalue (the last input) is below the line.

%   Function to acheieve this known_answer.m

%% Step 2: Ask perceptron to guess an answer. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Our next step is to compare our desired output (computed in Step 1) to
%  the output guessed by the perceptron. To do so, we'll need to compute
%  the *feedforward* solution for the perceptron (i.e., given the inputs
%  and bias, determine the perceptron output).
%
%  feedforward.m
%
%  This function takes five inputs:
%
%  x  = the x coordinate of the point we choose in the plane.
%  y  = the y coordinate of the point we choose in the plane.
%  wx = the weight of x input.
%  wy = the weight of y input.
%  wb = the weight of the bias.
%
%  And this function returns one output:
%
%  perceptron_output = the perceptron's guess, is the point above (=1) or
%  below (=0) the line.

%% Step 3: Compute the error. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  The error is the difference between these two answers:

error = desired_output - perceptron_output;


%% Step 4: Adjust all weights according to the error. %%%%%%%%%%%%%%%%%%%%%
%  Remember the expression,
%
%  new weight = weight + error * input * learning constant
%
%  We need to compute this for each weight (wx, wy, wb).
%
%  First, let's set the learning constant,

learning_constant = 0.01;

%  Then, we can compute the new weights,

wx = wx + error*x   *learning_constant;
wy = wy + error*y   *learning_constant;
wb = wb + error*bias*learning_constant;

%% Step 5. Return to Step 1 and repeat ... %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  We want to evaluate this procedure 2000 times.

clear

slope     = 2;          %Define the line with slope, 
intercept = 1;          %... and intercept.

wx = 0.5;               %Choose initial values for the perceptron's weights
wy = 0.5;
wb = 0.5;

learning_constant = 0.01;  % And, set the learning constant.

for k=1:2000                %For 2000 iteractions,
    
    x = randn(1);           %Choose a random (x,y) point in the plane
    y = randn(1);
                            %Step 1: Calculate known answer.
    desired_output = known_answer(slope, intercept, x, y);
    
                            %Step 2. Ask perceptron to guess an answer.
    perceptron_output = feedforward(x, y, wx, wy, wb);
    
                            % Step 3. Compute the error.
    error = desired_output - perceptron_output;
    
                            % Step 4. Adjust weights according to error.
    wx = wx + error*x*learning_constant;
    wy = wy + error*y*learning_constant;
    wb = wb + error*1*learning_constant;
    
    % Display the results! ------------------------------------------------
    
    estimated_slope = -wx/wy;       %Compute estimated slope from perceptron.
    estimated_intercept = -wb/wy;   %Compute estimated intercept from perceptron.
    
    x_range = (-2:0.01:2);                  %For a range of x-values,
    plot(x_range, slope*x_range+intercept)  %... plot the true line,
    hold on                                 %... and the perceptron's guess.
    plot(x_range, estimated_slope*x_range+estimated_intercept, 'r')
    hold off
    title(num2str(k))
    xlabel('x')
    ylabel('y')
    legend({'True line'; 'Perceptron estimate'})
    pause(0.1)
end





