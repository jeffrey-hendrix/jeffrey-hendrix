%%
%----------------------------------------------------
%                   ZORK STYLE GAME
%----------------------------------------------------
%
clc
clear all
array = zeros(10,10);
num = 1;
for i = 1:10
    for j = 1:10
        array(i,j) = num;
        num = num+1;
    end
end
map = ones(10,10);
x = 1;
y = 1;
ArrayPosNow = array(x,y);
items = ["none","none","none"];
fprintf('Move with w,a,s,d - i to check items - e to leave - m for map - c for controls\n')
controls = 'Move with w,a,s,d - i to check items - e to leave - m for map';
fprintf('\nYou wake up in a dimly lit room which resembles some sort of cave.\nExplore and see what you find.\n');
while true
    action = input('\nEnter an action - ','s');
    fprintf('\n');
    if action == 'c'
        disp(controls)
    end
    if action == 'i'
        disp(items)
    end
    if action == 'e'
        break
    end
    if action == 'm'
        disp(map)
    end
    if length(action) > 1 || isempty(action) == 1
        disp('Incorrect input')
    elseif action ~= 'w' && action ~= 'a' && action ~= 's' && action ~= 'd' && action ~= 'i' &&...
        action ~= 'm' && action ~= 'e' && action ~= 'c'    
        disp('Incorrect input')
    end
    if action == 'w'
        if ArrayPosNow <= 10
           disp('There is an impenetrable wall here, I have to find another way!')
        else
            map(x,y) = 1
            x = x - 1;
            ArrayPosNow = array(x,y);
            clc
            map(x,y) = 0
        end
    end
    if action == 'a'
        if rem(ArrayPosNow,10) == 1
           disp('There is an impenetrable wall here, I have to find another way!')
        else
            map(x,y) = 1
            y = y - 1;
            ArrayPosNow = array(x,y);
            clc
            map(x,y) = 0
        end
    end
    if action == 's'
        if ArrayPosNow >= 91
           disp('There is an impenetrable wall here, I have to find another way!')
        else
            map(x,y) = 1
            x = x + 1;
            ArrayPosNow = array(x,y);
            clc
            map(x,y) = 0
        end
    end
    if action == 'd'
        if rem(ArrayPosNow,10) == 0
           disp('There is an impenetrable wall here, I have to find another way!')
        else
            map(x,y) = 1
            y = y + 1;
            ArrayPosNow = array(x,y);
            clc
            map(x,y) = 0
        end
    end
    if ArrayPosNow == 23 && items(1) == "none"
        prompt1 = input('There is a coin purse on the floor.\nDo you want to pick it up? y to pick up, n to continue. ','s');
        if prompt1 == 'y'
            fprintf('\nYou picked up the coin purse and put it in your bag\n')
            items(1) = 'coin purse';
        elseif prompt1 == 'n'
            fprintf('\nYou did not pick up the coin purse\n')
            items(1) = 'none';
        else
            fprintf('\nIncorrect input\n')
        end
    elseif ArrayPosNow == 82 && items(2) == "none"
        prompt6 = input('There is a key on the floor,\nDo you want to pick it up? y to pick up, n to continue. ','s');
        if prompt6 == 'y'
            fprintf('\nYou picked up the key and put it in your bag\n')
            items(2) = 'key';
        elseif prompt6 == 'n'
            fprintf('\nYou did not pick up the key\n')
            items(2) = 'none';
        else
            fprintf('\nIncorrect input\n')
        end
    elseif ArrayPosNow == 9 && items(3) == "none"
        prompt7 = input('There is a tasty snack on the floor.\nDo you want to pick it up? y for yes, n to continue. ','s');
        if prompt7 == 'y'
            fprintf('\nYou picked up the snack and put it in your bag :)\n')
            items(3) = 'snack';
        elseif prompt7 == 'n'
            fprintf('\nYou left the snack on the ground :(\n')
            items(3) = 'none';
        else
            fprintf('\nIncorrect input\n')
        end
    elseif ArrayPosNow == 60
        disp('There is a trap door in the ground with a keyhole in it.')
        if strcmp(items(2), 'key') == 1
            prompt4 = input('You found the key! Do you want to use it? y for yes, n for no. ','s');
            if prompt4 == 'y'
                disp('You put the key in the lock, and turn it.')
                disp('The trapdoor opens, and you look inside. It is completely dark.')
            end
            if strcmp(items(3),'snack') == 1
                disp('You sit above the hole eating your snack while deciding whether or not you should enter.')
                disp('Eventually, you succumb to the desire of potential treasure, and jump down into the dark.')
                break
            else
                disp('Eventually, you succumb to the desire of potential treasure, and jump down into the dark.')
                break
            end
        else
            disp('I do not have the key. I need to continue searching.')
        end
    end
end
%%
%------------------------------------------
%                 Second level
%------------------------------------------
clc
clear all

% SETTING UP MAP AND MAP INDEX
array = zeros(5,5);
num = 1;
for i = 1:5
    for j = 1:5
        array(i,j) = num;
        num = num+1;
    end
end
x = 1;
y = 1;
ArrayPosNow = array(x,y);
map = ones(5,5);

% SETTING UP EMPTY INVENTORY AND JOURNAL
items = ["none","coin purse","none"]; % temporary
items2 = ["none","none","none","none","none","none","none","none","none","none"];
if strcmp(items(1),'coin purse') == 1
    items2(10) = 'coin purse';
else
    items2(10) = 'none';
end
journal = ["none","none","none"];
disp('You fall only but a few feet, and sustain no serious injuries.')
fprintf('You crawl around until you find something on the ground. \nThere is a torch, and next to it a tiny pocket journal with pages ripped out. \nThere are 3 remaining.\n')
disp('You manage to light the torch somehow, and are ready to explore.')
fprintf('\nPress c for controls\n')
controls = 'Move with w,a,s,d - i to check items - e to leave - m for map\nj for journal entry - o to look at journal';
disp(map)

% START OF MAIN LOOP WHERE EVERYTHING HAPPENS
while true
%
%   ACTION
%
    action = input('Enter Action - ','s');
    fprintf('\n');
%
%   KEYBINDS
%
    if action == 'c'
        fprintf(controls)
    end
    if action == 'i'
        disp(items2)
    end
    if action == 'e'
        break
    end
    if action == 'j'
        j = input('Enter a journal page.\nThere is only enough room for one word.\You may replace words. ');
        entry = input('What do you want to enter on that page: ','s');
        journal(j) = entry;
    end
    if action == 'o'
        disp(journal)
    end
%     if length(action) > 1 || isempty(action) == 1
%         disp('Incorrect input')
%     elseif action ~= 'w' && action ~= 'a' && action ~= 's' && action ~= 'd' && action ~= 'i' &&...
%         action ~= 'm' && action ~= 'e' && action ~= 'c'    
%         disp('Incorrect input')
%     end 
%
%   MOVEMENT SECTION
%
    if action == 'w'
        if ArrayPosNow <= 5
           disp('There is an impenetrable wall here, I have to find another way!')
        else
            map(x,y) = 1
            x = x - 1;
            ArrayPosNow = array(x,y);
            clc
            map(x,y) = 0
        end
    end
    if action == 'a'
        if rem(ArrayPosNow,10) == 1 || rem(ArrayPosNow,10) == 6
           disp('There is an impenetrable wall here, I have to find another way!')
        else
            map(x,y) = 1
            y = y - 1;
            ArrayPosNow = array(x,y);
            clc
            map(x,y) = 0
        end
    end
    if action == 's'
        if ArrayPosNow >= 21
           disp('There is an impenetrable wall here, I have to find another way!')
        else
            map(x,y) = 1
            x = x + 1;
            ArrayPosNow = array(x,y);
            clc
            map(x,y) = 0
        end
    end
    if action == 'd'
        if rem(ArrayPosNow,10) == 0 || rem(ArrayPosNow,10) == 5
           disp('There is an impenetrable wall here, I have to find another way!')
        else
            map(x,y) = 1
            y = y + 1;
            ArrayPosNow = array(x,y);
            clc
            map(x,y) = 0
        end
    end
 %
 % ITEM INSPECTION
 %
 % items2(1) = rope, items2(2) = snack, items2(3) = coin purse, items2(4) = red key,
 % items2(5) = rusty key, items2(6) = black key, items2(7) = scroll,
 % items2(8) = easter egg, items2(9) = torch, items2(10) = coin purse
 %
 % item combos for puzzles
 % - if torch & scroll (password for key in chest)
 % - if rope & pole (key in bottom of well, fish out)
 % - if monster and snack (coin purse lying in monsters den)
 % - if 3 gold and merchant (easter egg)
 %
 % ROOM SPECIFICTAION
 %
    if ArrayPosNow == 2 % MONSTER ROOM
        % if no snack
        fprintf('The room has a horribly foul smell.\nYou hold your torch up so you can see better.\n')
        fprintf('Before you sits none other than the elusive sleestack,\nthought to be extinct and lost to the ages.')
        fprintf('With a slight glint from your torch, you can see a coin purse sitting among the bones in its den.')
        fprintf('A one on one fight with no weapon would mean sure defeat. There has to be a way to get that coin purse!')
        % else 'maybe i have something useful'
        % coin purse says 'property of Cha-Ka on it' RIP
    end
    if ArrayPosNow == 4 % ROPE ROOM ( add item deletion after pickup )
        fprintf('The room is barren, except for a ripped up backpack in the corner by a rock.')
        prompt1 = input('Do you wish to examine the backpack?','s');
        if strcmp(prompt1,'yes') == 1
            disp('You found a rope. This should come in handy at some point.')
            items2(1) = 'rope';
        elseif strcmp(prompt1,'no')
            disp('You choose not to examine the backpack')
        else
            disp('Incorrect input')
        end
    end
    if ArrayPosNow == 10 % SNACK ROOM ( add item delettion after pickup )
        disp('When you walk into the room, you see a pedestal in the center')
        prompt2 = input('Do you want to approach the pedestal?');
        if strcmp(prompt2,'yes') == 1
            disp('Upon the almost crumbling pedestal sits a mouth watering snack.')
            prompt3 = input('Do you wish to pick up the snack?');
            if strcmp(prompt3,'yes') == 1
                disp('You put the snack in your bag.')
                items2(2) = 'snack';
            elseif strcmp(prompt3,'no') == 1
                disp('You decide not to pick up the snack :(')
            end
        elseif strcmp(prompt3,'no') == 1
            disp('You decide not to approach the pedestal')
        end
    end
    if ArrayPosNow == 16 % GOLD ROOM ( add item deletion after pickup )
        fprintf('The room is very small, and has many crevices in the wall')
        prompt4 = input('Do you wish to inspect the room?','s');
        if strcmp(prompt4,'yes') == 1
            disp('You search around and stick your hand into the many cracks.')
            disp('Right when you are about to give up and head to the next room,')
            disp('you see a crack that looks almost too perfectly smooth to be natural.')
            disp('In the crack you find a gold coin purse')
            items2(3) = 'coin purse';
        elseif strcmp(prompt4,'no')
            disp('You deccide not to inspect the room.')
        else
            disp('Incorrect input')
        end
    end
    if ArrayPosNow == 19 % SCROLL ROOM ( add deletion after pickup )
        disp('When you walk into the room, you see a pedestal in the center')
        prompt5 = input('Do you want to approach the pedestal?');
        if strcmp(prompt5,'yes') == 1
            disp('Upon the almost crumbling pedestal sits a scroll on a stand inside a glass lid.')
            prompt6 = input('Do you wish to pick up the scroll?');
            if strcmp(prompt6,'yes') == 1
                disp('You put the scroll in your bag.')
                items2(4) = 'scroll';
            elseif strcmp(prompt6,'no') == 1
                disp('You decide not to pick up the scroll')
            end
        elseif strcmp(prompt5,'no') == 1
            disp('You decide not to approach the pedestal')
        end
    end
    if ArrayPosNow == 6 % CODE ROOM ONE
        disp('When you first enter the room, it seems completely empty')
        prompt7 = input('Do you want to inspect the room further?');
        if strcmp(prompt7,'yes') == 1
            disp('You use your torch to illuminate the room.')
            fprintf('Despite the dim light, you are able to make\n')
            disp('out two numbers carved into one of the walls.')
            disp('They read: 13')
        elseif strcmp(prompt7,'no')
            disp('You decide not to inspect the room, and move on')
        end
    end
    if ArrayPosNow == 18 % CODE 2 ROOM
       disp('When you first enter the room, it seems completely empty')
        prompt8 = input('Do you want to inspect the room further?');
        if strcmp(prompt8,'yes') == 1
            disp('You use your torch to illuminate the room.')
            fprintf('Despite the dim light, you are able to make\n')
            disp('out two numbers carved into one of the walls.')
            disp('They read: 18')
        elseif strcmp(prompt6,'no')
            disp('You decide not to inspect the room, and move on')
        end
    end
    if ArrayPosNow == 12 % KEY 1 ROOM ( add item deletion after pickup )
    end
    if ArrayPosnow == 25 % KEY 2 ROOM ( add item deletion after pickup )
    end
    if ArrayPosNow == 9 % KEY 3 ROOM ( add item deletion after pickup )
    end
    if ArrayPosNow == 22 % MERCHANT ROOM
        disp('This is the first clean room you have seen thus far.')
        disp('in one of the corners of the room is small hut, with a man inside.')
        disp('You walk up to the man and ask what he is doing here.')
        disp('He tells you he is a merchant, selling exotic goods.')
        disp('He asks you if you would like to buy anything.')
        disp('Nothing he mentions cathes your eye, so you tell him no thanks')
        disp('Right before you walk away, he says he has very special item for sale.')
        fprintf('Normally he would not sell it to just anyone, \nbut he says if you bring him three purses of gold, he will make an exception.')
        promptX = input('If you have 3 gold purses, would you like to buy the item?');
            if strcmp(promptX,'yes') == 1
                if strcmp(items2(3),'coin purse') == 1 && strcmp(items2(8),'coin purse') == 1 && strcmp(items2(10),'coin purse') == 1
                    disp('He looks shocked, and pulls out a dusty plastic flash drive')
                    disp('He tells you this is his prized possession, and that you should take great care of it')
                end
            elseif strcmp(promptX,'no') == 1
                disp('Sadly you do not have three coin purses. Go find them so you can figure out what the item is.')
            end
    end
end % END OF WHILE LOOP



%%
% level two schematic

% items: 
% one gold purse from level one(maybe), one from this level
% rope
% scroll
% snack
% three keys

% main idea for three key locations
% 1 - merchant
%   - With three gold, can buy from merchant (easteregg)
%   - fight monster for more gold - trick with snack throw to other corner )

% 2 - bottom of well
%   - use rope to tie to rod and fish out of well.

% 3 - passcode locked box 
%   - use torch and scroll, hold torch under scroll and see invisible ink
%   passcode
%   - find other two codes etched into floor, and record in journal

% organization 

% 1 - make sure movements and boundaries work for whole map - WORKS FOR NOW
% 2 - journal works for ideal condition - WORKS FOR NOW
% 3 - add item inspection/combination 
% 4 - add each room's specific components
% 5 - add base of each puzzle
% 6 - add discriminator for item combination/possibility in each room
% 7 - thoroughly test and fix all bugs

%%
if ArrayPosNow == 13 && items2(1) == "none"
        prompt4 = input('There is an old scroll on the floor. It is old, tattered, and illegible.\nDo you want to pick it up? y to pick up, n to comtinue. ','s');
        if prompt4 == 'y'
            items2(1) = 'elder scroll';
        elseif prompt4 == 'n'
            items2(1) = 'none';
        end
    elseif ArrayPosNow == 7 && items2(2) == "none"
        prompt7 = input('There is a tasty snack on the floor.\nDo you want to pick it up? y for yes, n for no. ','s');
        if prompt7 == 'y'
            disp('You picked up the snack and put it in your bag')
            items2(2) = 'snack';
        elseif prompt7 == 'n'
            fprintf('\nYou left the snack on the ground :(\n')
            items2(2) = 'none';
        end
    elseif ArrayPosNow == 20 && items2(3) == "none"
        prompt8 = input('There is a rope on the floor,\nDo you want to pick it up? y to pick up, n for no.','s');
        if prompt8 == 'y'
            disp('You picked up the rope and put it in your bag')
            items2(3) = 'rope';
        elseif prompt7 == 'n'
            fprintf('\nYou left the rope on the ground \n')
            items2(3) = 'none';
        end
    elseif ArrayPosNow == 2 && items2(4) == "none"
        prompt9 = input('There is a rusty key on the floor.\nDo you want to pick it up? y for yes, n for no. ','s');
        if prompt9 == 'y'
            disp('You picked up the key and put it in your bag')
            items2(4) = 'rusty key';
        elseif prompt7 == 'n'
            fprintf('\nYou left the rusty key on the ground \n')
            items(3) = 'none';
        end
    elseif ArrayPosNow == 18 && items2(5) == "none"
        prompt10 = input('There is a red key on the floor,\nDo you want to pick it up? y to pick up, n for no. ','s');
        if prompt10 == 'y'
            disp('You picked up the red key and put it in your bag')
            items2(5) = 'red key';
        end   
    elseif ArrayPosNow == 16 && items2(6) == "none"
        prompt11 = input('There is a black key on the floor.\nDo you want to pick it up? y for yes, n for no. ','s');
        if prompt11 == 'y'
            disp('You picked up the black key and put it in your bag')
            items2(6) = 'black key';
        end
    elseif ArrayPosNow == 11
        disp('You find two numbers etched into the ground in the center of the room. They read: 04')
    elseif ArrayPosNow == 6
        disp('You find two numbers etched into the ground in the center of the room. They read: 73')
    elseif ArrayPosNow == 12
        disp('There is a 4-digit padlock and a sign on the door')
        prompt12 = input('Enter the secret code if you dare. ');
        if prompt12 == 7043
            disp('You hear a the sound of a latch clicking, and the lock comes undone.')
            disp('In the center of the room is a trap door with three keyholes in it.')
            if strcmp(items2(5), 'red key') == 1 && strcmp(items2(6), 'black key') == 1 && strcmp(items2(4), 'rusty key') == 1
                prompt13 = input('You found all of the keys! Do you want to use them? y for yes, n for no. ','s');
                if prompt13 == 'y'
                    disp('You escaped!')
%                     break
                end
            else
            disp('I do not have all of the keys yet. I need to continue searching.')
            end
        else
            disp('It didnt work. I will come try again later')
        end
%     else
%         disp('There is nothing here. I need to move on.')
    end

