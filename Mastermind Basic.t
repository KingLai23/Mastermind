%User Iinputs
var rulesPlay, any : string

%Guesses from the user and actual code
var guess1, guess2, guess3, guess4 : int
var code1, code2, code3, code4 : int

%Booleans to check whether or not the code or guess should be used
var guess1Taken, guess2Taken, guess3Taken, guess4Taken : boolean
var code1Taken, code2Taken, code3Taken, code4Taken : boolean

%Attempt counter
var attemptNum := 1

%Counters for correct number + position and correct number + wrong position
var correctPos, correctNum : int
put "_________________________________________________________________"
put ""
put "|  MASTERMIND  |                                   |  King Lai  |"
put "_________________________________________________________________"
put ""
put "Type '1' to see the rules of the game."
put "Type '2' to start playing!"

loop
    get rulesPlay
    exit when rulesPlay = "1" or rulesPlay = "2"
    put "Invalid input, try again: " ..
end loop

if (rulesPlay = "1") then
    cls
    put "_________________________________________________________________"
    put ""
    put "Rules of the Game:"
    put "_________________________________________________________________"
    put ""
    put "A 4-digit code will be generated using numbers from 1-8."
    put ""
    put "You will have 12 attempts to guess the 4-digit code."
    put ""
    put "After each guess, you will be informed about how many numbers"
    put "you guess correctly that were in the right position, and how"
    put "many numbers you guessed correctly that weren't in the right"
    put "position."
    put ""
    put "Good Luck!"
    put "_________________________________________________________________"
    put ""
    put "Type any key to continue..."
    get any
end if

put "_________________________________________________________________"
put ""

%Generating the code
randint (code1, 1, 8)
randint (code2, 1, 8)
randint (code3, 1, 8)
randint (code4, 1, 8)

%Game starts here.
cls

put code1, " ", code2, " ", code3, " ", code4
put ""

loop
    %Resetting the values
    code1Taken := false
    code2Taken := false
    code3Taken := false
    code4Taken := false

    guess1Taken := false
    guess2Taken := false
    guess3Taken := false
    guess4Taken := false

    correctPos := 0
    correctNum := 0

    %User's guesses
    put "_________________________________________________________________"
    put ""
    put "This is attempt #", attemptNum
    put "_________________________________________________________________"
    put ""

    put "Enter the first guess: " ..
    loop
	get guess1
	exit when guess1 > 0 and guess1 < 9
	put "Invalid input, try again: " ..
    end loop

    put "Enter the second guess: " ..
    loop
	get guess2
	exit when guess2 > 0 and guess2 < 9
	put "Invalid input, try again: " ..
    end loop

    put "Enter the third guess: " ..
    loop
	get guess3
	exit when guess3 > 0 and guess3 < 9
	put "Invalid input, try again: " ..
    end loop

    put "Enter the fourth guess: " ..
    loop
	get guess4
	exit when guess4 > 0 and guess4 < 9
	put "Invalid input, try again: " ..
    end loop

    %Correct number in correct Position
    if (guess1 = code1) then
	code1Taken := true
	guess1Taken := true
	correctPos := correctPos + 1
    end if

    if (guess2 = code2) then
	code2Taken := true
	guess2Taken := true
	correctPos := correctPos + 1
    end if

    if (guess3 = code3) then
	code3Taken := true
	guess3Taken := true
	correctPos := correctPos + 1
    end if

    if (guess4 = code4) then
	code4Taken := true
	guess4Taken := true
	correctPos := correctPos + 1
    end if

    %Correct number in wrong position
    if (not code1Taken) then
	if (guess2Taken = false and guess2 = code1) then
	    guess2Taken := true
	    correctNum := correctNum + 1
	elsif (guess3Taken = false and guess3 = code1) then
	    guess3Taken := true
	    correctNum := correctNum + 1
	elsif (guess4Taken = false and guess4 = code1) then
	    guess4Taken := true
	    correctNum := correctNum + 1
	end if
    end if

    if (not code2Taken) then
	if (guess1Taken = false and guess1 = code2) then
	    guess1Taken := true
	    correctNum := correctNum + 1
	elsif (guess3Taken = false and guess3 = code2) then
	    guess3Taken := true
	    correctNum := correctNum + 1
	elsif (guess4Taken = false and guess4 = code2) then
	    guess4Taken := true
	    correctNum := correctNum + 1
	end if
    end if

    if (not code3Taken) then
	if (guess1Taken = false and guess1 = code3) then
	    guess1Taken := true
	    correctNum := correctNum + 1
	elsif (guess2Taken = false and guess2 = code3) then
	    guess2Taken := true
	    correctNum := correctNum + 1
	elsif (guess4Taken = false and guess4 = code3) then
	    guess4Taken := true
	    correctNum := correctNum + 1
	end if
    end if

    if (not code4Taken) then
	if (guess1Taken = false and guess1 = code4) then
	    guess1Taken := true
	    correctNum := correctNum + 1
	elsif (guess2Taken = false and guess2 = code4) then
	    guess2Taken := true
	    correctNum := correctNum + 1
	elsif (guess3Taken = false and guess3 = code4) then
	    guess3Taken := true
	    correctNum := correctNum + 1
	end if
    end if

    put ""
    put "The number of correct numbers in the correct position is: ", correctPos
    put "The number of correct numbers in the wrong position is: ", correctNum

    exit when attemptNum = 12 or guess1 = code1 and guess2 = code2 and guess3 = code3 and guess4 = code4
    attemptNum := attemptNum + 1
    put ""
end loop

put "_________________________________________________________________"
put ""

if (guess1 = code1 and guess2 = code2 and guess3 = code3 and guess4 = code4) then
    if attemptNum = 1 then
	put "YOU WIN!!! You cracked the code on your FIRST attempt!!"
    else
	put "YOU WIN!!! You cracked the code in ", attemptNum, " attempts!"
    end if
    %User didn't win
else
    put "You have exceeded the maximum number of attempts. Nice try.."
    put "The correct code was: ", code1, " ", code2, " ", code3, " ", code4
end if

put "_________________________________________________________________"
put ""
