% Notes about various things 
clc
% A = [1 2 3; 4 5 6; 7 8 9];
% B = [1 2 3; 4 5 6];
% a = 2;

%running through array functions
    %A
    %A*5
    %A*a
    %[A,B] %adds B to end of A vertically
    %[A;B] %adds B to end of A horizontally
    %A(2) = 12 %change second element of A to 12
    %A(1,3) = 16 %change element in row 1 column 3 to x
    %A(3:6) %Get 3rd to 6th element of x
    %A(1:2:end) %Get every second element of A starting from 1 to end
    %A(A>3) %list elements greater than x
    %A(A==10)=1 %change elements using a condition ( didn't work )
    %A(2,:) %get specific row of x
    %A(:,1) %get specific column of x
    %A(2, 2:3) %in specific row, get specific elements
    %A(:,[1 3])=A(:,[3 1]) %swap columns
    %zeros(6,5) %makes matrix of zeros with specified size
    %ones(5,2) %makes matric of ones with specified size
    %eye(5,5) %creates an identity matrix of specified size
    %A = diag(x) %creates diagonal matrix from vector (idk)
    %C = diag(A) %get diagonal elements of matrix
    %rand(6,7) %uniformly distributed random numbers/integers
    %randi(3,4) %for integers only
    %randn(2,2) %normally distributed random numbers


    % 'Hello' %character vector
    % "This is a string" %string

    % str1 = "subject + ";
    % str2 = "object + ";
    % str3 = " verb"; 
    % str4 = str1 + str2 + str3;
    % str4 
%% 
%Programming methods
%functions
clc
prompt = 'Think of an integer between 0 and 10. ';
x = action(prompt);   %takes and displays user input

for i = 1:10
    if x > 10.0
        disp('integer too big, please try again.')
    elseif x < 0.0
        disp('integer too small, please try again')
    else
        x_guess = randi([0 10],1,1);
        fprintf('Your number is %d?\n', x_guess)
        prompt = 'Is that correct? ';
        x = action(prompt); 
     end
end
%   WORKS
%%
% ask for numeber between 0 and 10

fprintf('is your number: %d', randi([0 10],1,1))
randi([0 10],1,1)

prompt = 'Think of a number between 0 and 10? ';
% x = input(prompt);
y = randi(10);
fprintf('Is your number: %d?\n', y)
%   WORKS
%%
% want to do
% ask for number input, check within bounds
clc
x = action('Enter a number between 1 and 10: ');
x_guess = -1;
while x ~= x_guess
    if x > 10.0
        disp('integer too big, please try again.')
        x = action('Enter a new number: ');
    elseif x < 1
        disp('integer too small, please try again.')
        x = action('Enter a new number: ');
    else
        x_guess = randi([0 10],1,1);
        fprintf('I think your number is %d\n',x_guess)
        ansr = action('Is this your number? 1 for Yes, 0 for No? ');
        if ansr == 1
            break
        end   
    end

end
fprintf('Yay I guessed your number!\n')
%WORKS, can make better
%%
clc
%First simple for loop
disp("I have 1 thing")
for i = 2:5
    disp("I just added one.")
    fprintf('Ypu now have %d things.\n',i)
end
%WORKS
%%
%Making while loop work better
clc
% M = [1:10];
x = action('Enter an integer between 1 and 10: ');
x_guess = -1;
while x ~= x_guess
    if x > 10.0
        disp('Integer too big, please try again.')
        x = action('Enter a new number: ');
    elseif x < 1
        disp('Integer too small, please try again.')
        x = action('Enter a new number: ');
    else
%         for i = 1:10
            x_guess = randi([0 10],1,1);
            fprintf('I think your number is %d\n',x_guess)
            ansr = action('Is this your number? 1 for Yes, 0 for No? ');
%             M = [M,x_guess];
            if ansr == 1
                fprintf('Yay I guessed your number!\n')
                break
%             else
%                 fprintf('I did not guess your number\n')
%                 break
            end
%            end
    end
end
%%
%want to add way to remember which numbers were guessed and narrow down
%need to discrimnate numbers out of possible choices
%First, list of possible choices
%Next, need to remember each number as its guessed
%Next, need to throw out the nuber from the list each time
%Probably need for loop for that

%first create empty matrix done
%check that matrix for some value

% x = [];
% % a = 1;
% % b = 1;
% for i=1:10 
% %     s = a + b + i;
%     x = [x,i];
% end
% x


% Fills array with random numbers until loop requirement met
% M = []
% for i = 1:10
%             x_guess = randi([0 10],1,1);
%             M = [M,x_guess];
% end
% M

%FIXING random number selection
%Made an empty array that is filled by numbers randomly chosen from array
%of values, until the amount of numbers chosen is equivalent to the length
%of the choice array
%Now need to find a way to only choose numbers from choice that haven't
%been chosen before
% first, replace chosen number with zero
% then check for zero on next go around before choosing
% stop when all zero, aka nothing left to choose from 

clc
M = (1:10); % M is 10 long with one through ten (doesn't change)
used = zeros(1,10);  % used is initially empty, and fills with random integers from M
x = 1;      % choice stores a single number from M each loop         
while x ~= length(M) + 1
    in = action('Hit Enter');
    choice = M( randi([1,size(M,1)],1), randi([1,size(M,2)],1) );
    used(x) = choice;
    for i = 1:length(M)
        if choice == M(i)
            M(i) = 0;
        end
    end
    x = x+1;
    M;
end
% % choice
% used
% maybe better would be to not rely on length, and just transfer from M
% to used so M depletes and the only thing left are the remaining numbers
% add condition where zero is not allowed to be chosen from M


%random numbers in random order with no repeats
% clc
F = 1:10;
choice = randperm(10);
T = zeros(1,10);
for i = 1:10
    T(i) = choice(i);      
end
%%
%THE FINAL NUMBER GUESSER
clc
choice = randperm(10);
x = action('Enter an integer between 1 and 10: ');
x_guess = -1;
while x ~= x_guess
    if x > 10.0
        disp('Integer too big, please try again.')
        x = action('Enter a new number: ');
    elseif x < 1
        disp('Integer too small, please try again.')
        x = action('Enter a new number: ');
    else
        for i = 1:10
            x_guess = choice(i);
            fprintf('I think your number is %d\n',x_guess)
            ansr = action('Is this your number? 1 for Yes, 0 for No? ');
            if ansr == 1
                fprintf('Yay I guessed your number!\n')
                break
            elseif i==10
                fprintf('I did not guess your number\n')
                break
            end
        end
        break
    end
end
%WORKS
%Fixed original issue using new matlab function found 'randperm()' 
%%
%Using find()

rng default     % resets to matlab preset random starting point
A = randi(5,1,10);
B = A < 3;
A(B)
find(A<3) % gives location of values with proposed condition
%%

% Useful Math functions

f1 = @(x) (x.^2 + 7.*x);  % need "." for calculation. Something to do with matrix size matching
x1 = 3;                   % need @ for initializing x without variable
x2 = 6;

funct = integral(f1,x1,x2);  % integral of function f over bounds x1 to x2
% graphing functions
x = (-10:.1:10);
fun = sin(x);
plot(x,fun)
% want to fill array 
fill = zeros(10,2);
% x = [1,2,3,4,5,6,7,8,9,10];
% y = 1:10;
% y2 = [1:10;2:2:20];
%%
% workbook
% create 6x1 vector of zeros using zeros()
% create row vector b from 325 to 405 with an interval of 20
% use sum to find sum of vector b's elements
% create two different vectors of the same length and add them
% now subtract them
% perform element-by-element multiplication on them
% perform element by element division on them
% raise on of the vectors to the second power
% create a 3x3 matrix and display the first row / second column

vector = zeros(6,1);
vecb = (325:20:405);
add = sum(vecb);
a = 40*ones(1,10);
b = 29*ones(1,10);
ab = a + b;
ba = a - b;
atb = a.*b;
adv = a./b;
araise = a.^2;
three = randi(15,3);
three(1,:);
three(:,2);
%%

%Plotting trajectories example

g = 9.8;
t = 0:.1:10;
vint = 50;
xint = 0;
yint = 0;
theta0 = 5*pi/12;

y = yint - (1/2)*g*(t.^2) + (vint)*(sin(theta0)).*t;
x = xint + (vint*cos(theta0)).*t;

figure;
plot(t,x,'b');
hold on
plot(t,y,'r');
hold off
title('projectile motion plot');
xlabel('time(s)');
ylabel('distance(m)');
xlim([0 10]);
ylim([0 200]);
legend('distance in x','distance in y')
grid on;
%%
%Plotting exercises
%Using plot command for multiple plots, plot y = atan(x) and y = acot(x) on
%the same graph for values of x defined by x = -pi/2:pi/30:pi/2
x = -pi/2 : pi/30 : pi/2;
y1 = atan(x);
y2 = acot(x);
figure;
plot(x,y1);
hold on
plot(x,y2);
hold off
title("Trig function graphing");
xlabel("radians");
ylabel("amplitude");
legend("tan fxn","cot fxn");
grid on;

%using ezplot command, plot y=2/3sin(9*pi*x) for values of x such that
% 0 <= x <= 2*pi
% interval = 0 : 2*pi ;
% y = (2/3)*sin(9*pi*x);
% ezplot(y,[0,2*pi]);   % didn't work. fplot didnt either

%%
%Matlab programming
%
%%
% for and while loops
% nested loops
% create nested loop that adds two numbers and displays sum

i = 5;
j = 5;
array = zeros(5,5);
for x = 1:i
    for y = 1:j
      one = randi(10,1);
      two = randi(10,1);
      add = one + two; 
      array(x,y) = add;
    end
end
%sums two random numbers and uses nested loop to fill 2d matrix
%%
%use relational operators for checking string inputs
%ask user to input string
%check string using condition
%maybe check for specific characters

%input full name. Output name length
%Steps
%ask for input
%first if statement find spaces
%subtract spaces from total count

name = action('Please type your full name: ', 's');
spaces = 0;
letters = 0;
for i = 1:strlength(name)
    if ischar(name(i)) == 1 && isspace(name(i)) == 0
        letters = letters + 1;
    end
end
fprintf('Your name is %d letters long!\n',letters)
%%
while 1==1
    entry = action('input any word 3 letters or longer \n','s');
    if ischar(entry(3)) == 1
        char = entry(3);
        letter = convertCharsToStrings(char);
        fprintf('the third letter is ');
        disp(letter);
        break
    else
        disp('too short, enter again');
    end
end
%Works when checking for char, and then convert to string
%%
%Using logical operators inside if/loop statement
% check for even odd
while true
    num = action('Enter any number ');
    if rem(num,2) == 0
        disp('number is even');
    else
        disp('number is odd'); 
    end
end
%WORKS
%%
% testing functions
%made a file called fxn, which will contain various
%function all with the same name

%velocity, with speed,distance
% fxn(5,20)

%age, with birthyear, current year
% fxn(1998,2021)
%%
%USING MASKS
%
%%
mask = [1 0 0;0 1 0;0 0 1];
A = [1 2 3;4 5 6;7 8 9];
B = A>4;
C = zeros(3);
C(B) = 5;

k = [1 2 3 4 4 5 5 5 6 7 4 5 9];
mask = C==5;
new_k = k(k<6);
%%
% for the circuit
% mask matrix that equals 1 for kth higher than zero
% use mask to index corresponding pos of R_nodes
% initialize R_contact_nodes to zero and then enter distance_nodes / kth_area_contact_nodes
% in the corresponding positions where kth_area_contact_nodes is higher than zero

% kth = some 3x3
R_contact = distance ./ kth
distance = [1 2 1;1 2 1;1 2 1];
A = [0 0 3;0 5 0;0 0 0];       %A is kth
mask = A>0;                    %mask for kth (shows where kth > 0)
R_contact = zeros(3);
R_contact(mask) = distance(mask) ./ A(mask);
%%
%INTEGER FACTORS GENERATOR
%can use (isprime()) to check if prime or not to start
%if not prime, want to find factors
%loop two numbers. if those numbers multiplied equal int, they are factors
%cant take negatives yet
clc
x = 1;
y = 1;
int = action('Please enter a positive integer between 0 and 1000. ');
while true
    if int<0 || int>1000 %negative and >100 check
        disp('Integer out of range');
        int = action('Please enter a positive integer between 0 and 1000. ');
    elseif isprime(int) && int<=1000 && int>=0 %prime check
        disp('You entered a prime integer');
        int = action('Please enter a non-prime integer ');
    elseif int<=1000 && int>=0
        disp('All possible factor pairs are:');
        for x = 1:int
            for y = 1:int
                if x*y==int
                    fprintf('       %d %d\n',x,y);
                    pause(.2)
                end
            end
        end
        s1 = action('To try again, press any key. To stop, enter "stop". ','s');
        s2 = 'stop';
        if strcmp(s1,s2) == 1
            break
        else
            int = action('Please enter a positive integer between 0 and 1000. ');
        end
    end
end
%WORKS
%%
%IMAGE MANIPULATION
%
%%
% New problem
% something with images
% more embedded loops
% perhaps take in a folder of images, and first read data about images
pic1 = imread('C:\Users\jhendrix\Desktop\images\image1.jfif');
pic2 = imread('C:\Users\jhendrix\Desktop\images\image2.jfif');
pic3 = imread('C:\Users\jhendrix\Desktop\images\image3.jfif');
pic4 = imread('C:\Users\jhendrix\Desktop\images\image4.jfif');
% % display in mutliple figures, all stay on screen instead of being replaced
% imshow(pic1(:,:,:,1));
% figure, imshow(pic2(:,:,:,2))
% figure, imshow(pic3(:,:,:,3))
% figure, imshow(pic4(:,:,:,4))
% %haven't figured out yet
%%
%display multiple images in same figure
[X1,map1]=imread('C:\Users\jhendrix\Desktop\images\image1.jfif');  
[X2,map2]=imread('C:\Users\jhendrix\Desktop\images\image2.jfif');
[X3,map3]=imread('C:\Users\jhendrix\Desktop\images\image3.jfif');
[X4,map4]=imread('C:\Users\jhendrix\Desktop\images\image4.jfif');
subplot(2,2,1), imshow(X1,map1)
subplot(2,2,2), imshow(X2,map2)           %display multiple images in same plot
subplot(2,2,3), imshow(X3,map3)
subplot(2,2,4), imshow(X4,map4)             
%%
%make slideshow of one image per time interval
%need to loop over each image display
pic1 = imread('C:\Users\jhendrix\Desktop\images\image1.jfif');
pic2 = imread('C:\Users\jhendrix\Desktop\images\image2.jfif');
pic3 = imread('C:\Users\jhendrix\Desktop\images\image3.jfif');
pic4 = imread('C:\Users\jhendrix\Desktop\images\image4.jfif');
images={pic1,pic2,pic3,pic4};
for i = 1 : 4%size(images,2)
  subplot(1,2,1)
  image(images{1,i});
  set(gcf,'color',[0.25, 0.25, 0.25]);
  drawnow();
  pause(.5)
end
close(1)
%works, but images don't retain original resolution
%%
%Alternate method, which retains resolution
%images from folder into cell array
%found a method that uses strings to call file
nameReference = 'image'; % selects the base filename: 'image1.jfif','image2.jfif', etc.
myFolder = 'C:\Users\jhendrix\Desktop\images';
for i = 1:10
    fullFileName = fullfile(myFolder,sprintf('%s%.0f.jfif',nameReference,i));
    fprintf(1, '%s\n', fullFileName);
    imageArray{i} = imread(fullFileName);
    set(gcf,'color',[0.25, 0.25, 0.25]);
    imshow(imageArray{i});  % Display image. 
    pause(1)
end
close(1)
%Works
%%
%More stuff with images
%take image folder and display in collage like before
nameReference = 'image'; % selects the base filename: 'image1.jfif','image2.jfif', etc.
myFolder = 'C:\Users\jhendrix\Desktop\images';
for i = 1:10
    fullFileName = fullfile(myFolder,sprintf('%s%.0f.jfif',nameReference,i));
    fprintf('Image %d\n',i);
    imageArray{i} = imread(fullFileName);
    set(gcf,'color',[0.25, 0.25, 0.25]);
    imshow(imageArray{i});  % Display image.
    if i ~= 10
        pause(1)
    else
        pause(3)
    end
end
close(1)
%WORKS
%%
%Take images and fill collage one by one
% [X1,map1]=imread('C:\Users\jhendrix\Desktop\images\image1.jfif');  
image=imread('C:\Users\jhendrix\Desktop\images\image1.jfif'); 
for i = 1:4
subplot(2,2,i);
imshow(image);
pause(1)
end
%works for one image
%close() wont work   
%%
%Same thing for different images
image1 = imread('C:\Users\jhendrix\Desktop\images\image1.jfif'); 
image2 = imread('C:\Users\jhendrix\Desktop\images\image2.jfif');
image3 = imread('C:\Users\jhendrix\Desktop\images\image3.jfif');
image4 = imread('C:\Users\jhendrix\Desktop\images\image4.jfif');
array = {image1,image2,image3,image4};
for i = 1:4
subplot(2,2,i);
imshow(array{1,i});
pause(1)
end
close(1)
%WORKS
%%
%Same thing but from folder with all ten images in 2x5
nameReference = 'image'; % selects the base filename: 'image1.jfif','image2.jfif', etc.
myFolder = 'C:\Users\jhendrix\Desktop\images';
for i = 1:10
    fullFileName = fullfile(myFolder,sprintf('%s%.0f.jfif',nameReference,i));
    fprintf('Image %d\n',i);
    imageArray{i} = imread(fullFileName);
    set(gcf,'color',[0.25, 0.25, 0.25]);
    subplot(2,5,i);
    imshow(imageArray{i}); 
    pause(1)
end
close(1)
%WORKS
%Want to work on size/resolution of images and placement/distance
%%
nameReference = 'image'; % selects the base filename: 'image1.jfif','image2.jfif', etc.
myFolder = 'C:\Users\jhendrix\Desktop\images';
for i = 1:10
    fullFileName = fullfile(myFolder,sprintf('%s%.0f.jfif',nameReference,i));
    fprintf('Image %d\n',i);
    imageArray{i} = imread(fullFileName);
    set(gcf,'color',[0.25, 0.25, 0.25]);
    subplot(2,5,i);
    out = imtile(imageArray);
    imshow(out); 
    pause(1)
end
close(1)
%Does something interesting
%%
nameReference = 'image'; % selects the base filename: 'image1.jfif','image2.jfif', etc.
myFolder = 'C:\Users\jhendrix\Desktop\images';
fullFileName = fullfile(myFolder,sprintf('%s%.0f.jfif',nameReference,1));
% fprintf('Image %d\n');
imageArray{i} = imread(fullFileName);
set(gcf,'color',[0.25, 0.25, 0.25]);
out = imtile(imageArray);
imshow(out)
%Collage with no spacing in between
%%
%Break from images
%Want to do some stuff with data analysis

data = 'C:\Users\jhendrix\Desktop\Josep new task\Jeffrey_FluidProperties_20210726-selected\other_sources\propsoil';
%data for engine oil
exel = readtable(data);
table = exel(17:43,1:6);
temp = table(:,1);
density = table(:,2);
viscosity = table(:,3);
k_value = table(:,4);
Cp = table(:,5);
%dunno what to do with this
%%
%reverse a string

for i = 1:5
    str = action('Input any string\n\n','s');
    flip(str)
end
%solved with easy function
%%
%3D matrix
clc
array = [1 2 3;1 2 3;1 2 3];

for i = 1:3
array(:,:,i) = array(:,:,:);
end

%%
% methods for writing quicker programs

% preallocating matricies
% not using global variables
% less for loops, more vectorization
% loop down columns instead of rows
% use functions instead of scripts
% use logical indexing instead of find


%%
%----------------------------------------------------
%                   GAME
%----------------------------------------------------
%
% 3D array
% 3d space coordinates
% 1. create 3d space of coordinates 10x10x10 to start
% 2. move through 3d space with keys
% 3. w,a,s,d for moving in planes
% 4. space takes you to next plane, backspace takes you back

% ascii values, or string check
% (8/backspace), (32/SPACE), (119/w), (97/a). (115/s), (100/d)

% array = zeros(10,10,10);
% Create playing space of 100 "rooms"
clc
array = zeros(10,10);
num = 1;
for i = 1:10
    for j = 1:10
        array(i,j) = num;
        num = num+1;
    end
end
disp('You are in the top left corner of a 10 x 10 area. Explore and see what you find.');
x = 1;
y = 1;
ArrayPosNow = array(x,y);
items = ["none","none","none"];
while true
    action = input('Move with w,a,s,d. Enter "i" to check items. Enter "e" to leave. ','s');
    if action == 'i'
        disp(items)
    end
    if action == 'e'
        break
    end
    if action == 'w' && x > 1
        ArrayPosNow = x - 1;
        x = x - 1;
        ArrayPosNow = array(x,y);
        fprintf('You are now in room %d\n',ArrayPosNow)
    elseif action == 'a' && y > 1
        ArrayPosNow = y - 1;
        y = y - 1;
        ArrayPosNow = array(x,y);
        fprintf('You are now in room %d\n',ArrayPosNow)
    elseif action == 's' && x < 10
        ArrayPosNow = x + 1;
        x = x + 1;
        ArrayPosNow = array(x,y);
        fprintf('You are now in room %d\n',ArrayPosNow)
    elseif action == 'd' && y < 10
        ArrayPosNow = y + 1;
        y = y + 1;
        ArrayPosNow = array(x,y);
        fprintf('You are now in room %d\n',ArrayPosNow)
    else
        disp('There is an impenetrable wall here, I have to find another way!\n')
    end
    if ArrayPosNow == 23
        prompt1 = input('There is a coin purse on the floor,\nDo you want to pick it up? y to pick up, n to comtinue. ','s');
        if prompt1 == 'y'
            items(1) = 'coin purse';
        end
    elseif ArrayPosNow == 82
        prompt2 = input('There is a key on the floor,\nDo you want to pick it up? y to pick up, n to comtinue.','s');
        if prompt2 == 'y'
            disp('You picked up the key and put it in your bag')
            items(2) = 'key';
        end
    elseif ArrayPosNow == 9
        prompt3 = input('There is a tasty snack on the floor.\nDo you want to pick it up? y for yes, n for no.');
        if prompt3 == 'y'
            disp('You picked up the snack and put it in your bag')
            items(3) = 'snack';
        end
    elseif ArrayPosNow == 60
        disp('There is a trap door in the ground with a keyhole in it.')
        if strcmp(items(2), 'key') == 1
            prompt4 = input('You found the key! Do you want to use it? y for yes, n for no. ','s');
            if prompt4 == 'y'
                disp('You escaped!') % add second layer later
                break
            end
        else
            disp('I do not have the key. I need to continue searching.')
        end
    end
end
% disp('Thank you for playing')
disp('You open the trapdoor, and look in. It is completely dark. \nYou sit above the hole eating your snack while deciding whether you should go down or not. \nYou give into the desire of potential treasure, and jump down into the dark.\n')
%%
%------------------------------------------
%                 Second level
%------------------------------------------
disp('You fall only but a few feet, and sustain no serious injuries\n')
prompt5 = input('You crawl around until you find something on the ground. It seems to be torch.\nDo you want to pick it up? y or n?');
while true
    if prompt5 == 'y'
        disp('You manage to light it somehow, and are ready to explore.')
        break
    else
        disp('You cannot see, and therefor cannot proceed without the torch')
    end
end
array = zeros(15,15);
num = 1;
for i = 1:15
    for j = 1:15
        array(i,j) = num;
        num = num+1;
    end
end
x = 1;
y = 1;
ArrayPosNow = array(x,y);
items2 = ["none","none","none","none","none","none"];
while true
    action = input('Move with w,a,s,d. Enter "i" to check items. Enter "e" to leave. ','s');
    if action == 'i'
        disp(items2)
    end
    if action == 'e'
        break
    end
    if action == 'w' && x > 1
        ArrayPosNow = x - 1;
        x = x - 1;
        ArrayPosNow = array(x,y);
        fprintf('You are now in room %d\n',ArrayPosNow)
    elseif action == 'a' && y > 1
        ArrayPosNow = y - 1;
        y = y - 1;
        ArrayPosNow = array(x,y);
        fprintf('You are now in room %d\n',ArrayPosNow)
    elseif action == 's' && x < 15
        ArrayPosNow = x + 1;
        x = x + 1;
        ArrayPosNow = array(x,y);
        fprintf('You are now in room %d\n',ArrayPosNow)
    elseif action == 'd' && y < 15
        ArrayPosNow = y + 1;
        y = y + 1;
        ArrayPosNow = array(x,y);
        fprintf('You are now in room %d\n',ArrayPosNow)
    else
        disp('There is an impenetrable wall here, I have to find another way!\n')
    end
    if ArrayPosNow == 13
        prompt6 = input('There is a coin purse on the floor,\nDo you want to pick it up? y to pick up, n to comtinue. ','s');
        if prompt6 == 'y'
            items2(1) = 'coin purse';
        end
    elseif ArrayPosNow == 124
        prompt7 = input('There is a key on the floor,\nDo you want to pick it up? y to pick up, n to comtinue.','s');
        if prompt7 == 'y'
            disp('You picked up the key and put it in your bag')
            items2(2) = 'key';
        end
    elseif ArrayPosNow == 67
        prompt8 = input('There is a tasty snack on the floor.\nDo you want to pick it up? y for yes, n for no.');
        if prompt8 == 'y'
            disp('You picked up the snack and put it in your bag')
            items2(3) = 'snack';
        end
    elseif ArrayPosNow == 111
        disp('There is a trap door in the ground with three keyholes in it.')
        if strcmp(items2(2), 'red key') == 1 && strcmp(items2(3), 'black key') == 1 && strcmp(items2(4), 'rusty key') == 1
            prompt9 = input('You found all of the keys! Do you want to use them? y for yes, n for no. ','s');
            if prompt9 == 'y'
                disp('You escaped!') % add second layer later
                break
            end
        else
            disp('I do not have all of the keys yet. I need to continue searching.')
        end
    end
end
disp('Thank you for playing')


% BUGS
% when picking up item, and checking items right after, still on same
% position after, so it checks off the if again for == 23


% ADD 
% functions for each action