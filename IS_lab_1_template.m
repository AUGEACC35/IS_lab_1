%Classification using perceptron

%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

%Calculate for each image, colour and roundness
%For Apples
%1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
%2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
%3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
%4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
%5th apple image(A5)
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
%6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
%7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
%8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
%9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%2nd pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

%Desired output vector
T=[1;-1;-1;1;-1];

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1);

% calculate wieghted sum with randomly generated parameters
v1 = w1 * x1(1) + w2 * x2(1) + b;
% calculate current output of the perceptron 
if v1 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e1 = T(1) - y;

% repeat the same for the rest 4 inputs x1 and x2
% calculate wieghted sum with randomly generated parameters
v2 = w1 * x1(2) + w2 * x2(2) + b;
% calculate current output of the perceptron 
if v2 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e2 = T(2) - y;

% <...> write the code for another 3 inputs
v3 = w1 * x1(3) + w2 * x2(3) + b;
% calculate current output of the perceptron 
if v3 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e3 = T(3) - y;


v4 = w1 * x1(4) + w2 * x2(4) + b;
% calculate current output of the perceptron 
if v4 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e4 = T(4) - y;


v5 = w1 * x1(5) + w2 * x2(5) + b;
% calculate current output of the perceptron 
if v5 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e5 = T(5) - y;

% calculate the total error for these 5 inputs 
e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);





% Initialization
n = 0.01; % Learning rate
w1 = randn(1);
w2 = randn(1);
b = randn(1);
e = ones(5, 1);

while sum(e) ~= 0 % condition to check the total error
    for i = 1:5
        % weighted sum
        v = w1 * x1(i) + w2 * x2(i) + b;

        % current output of the perceptron 
        if v > 0
            y = 1;
        else
            y = -1;
        end

        % Error calculation
        e(i) = T(i) - y;

        % Update of weights and bias
        w1 = w1 + n * e(i) * x1(i);
        w2 = w2 + n * e(i) * x2(i);
        b = b + n * e(i);
    end
end

x3=[hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_A7 hsv_value_A8 hsv_value_A9 hsv_value_P3 hsv_value_P4];
x4=[metric_A4 metric_A5 metric_A6 metric_A7 metric_A8 metric_A9 metric_P3 metric_P4];

%default output is unknown
output = [0 0 0 0 0 0 0 0] 

for i = 1:8
    % weighted sum
    output(i) = w1 * x3(i) + w2 * x4(i) + b;

    % current output of the perceptron 
        fprintf('%i\n', output(i));
    if (output(i) > 0)
    {
        %printing "Pear" if result is identified as a pear.
        fprintf('%s\n', "Pear");
    }
    elseif (output(i) < 0)
    {
        %printing "Apple" if result is identified as an apple.
        fprintf('%s\n', "Apple");
    }
    end
end

