
% make a calculator
% functions include: add, sub, times, div, sqr, root...

while true
    disp("To stop, type 'stop' during the operation choice");
    choice = input("Choose an operation ( add, sub, times, div, sqr, root ): ",'s');
    if strcmp(choice,'stop') == 1
        break
    end
    if strcmp(choice,'add') == 1 || strcmp(choice,'sub') == 1 || strcmp(choice,'times') == 1 || strcmp(choice,'div') == 1
        numbers = input("Choose two numbers. Enter like the following [x y]: ");
    elseif strcmp(choice,'sqr') == 1 ||strcmp(choice,'root') == 1
        numbers = input("Choose one number. Enter like the following [x]: ");
    end
    answer = 0;
    if isnumeric(numbers(1)) == 1 && isnumeric(numbers(2)) == 1
        if strcmp(choice,'add') == 1
            answer = numbers(1) + numbers(2);
            fprintf('%d + %d = %d\n',numbers(1),numbers(2),answer);
        elseif strcmp(choice,'sub') == 1
            answer = numbers(1) - numbers(2);
            fprintf('%d - %d = %d\n',numbers(1),numbers(2),answer);
        elseif strcmp(choice,'times') == 1
            answer = numbers(1) * numbers(2);
            fprintf('%d * %d = %d\n',numbers(1),numbers(2),answer);
        elseif strcmp(choice,'div') == 1
            answer = numbers(1) / numbers(2);
            fprintf('%d / %d = %d\n',numbers(1),numbers(2),answer);
        end
    else
        disp("You entered the wrong amount of inputs for this operation")
    end
    if isnumeric(numbers(1)) == 1
        if strcmp(choice,'sqr') == 1
            degree = input("Choose a degree: ");
            answer = numbers(1)^degree;
            fprintf('%d ^ %d = %d\n',numbers(1),numbers(2),answer);
        elseif strcmp(choice,'root') == 1
            answer = sqrt(numbers(1));
            fprintf('The square root of %d is %d\n',numbers(1),answer);
        end
    else
        disp("You entered the wrong amount of inputs for this operation")
    end
end