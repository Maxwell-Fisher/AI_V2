@echo off
if exist "data\people\%computername%\%username%\name" set /p name=<"data\people\%computername%\%username%\name"
set new=1
if exist "data\people\%computername%\%username%\lastopened" set /p lastopened=<"data\people\%computername%\%username%\lastopened"
echo "%date%" > "data\people\%computername%\%username%\lastopened"
set greeting=Hello %name%!
::if %date% == %lastopened%&& set welcomeback=Welcome Back!
color 70
title AI V.2
if not exist "data\people\%computername%\%username%" md "data\people\%computername%\%username%"
if exist "data\people\%computername%\%username%\info" goto name_exists
echo username=%username% > "data\people\%computername%\%username%\info"
echo created=%date% %time% >> "data\people\%computername%\%username%\info"
echo userprofile=%userprofile% >> "data\people\%computername%\%username%\info"
echo userdomain=%userdomain% >> "data\people\%computername%\%username%\info"
echo userprofile=%userprofile% >> "data\people\%computername%\%username%\info"
echo logonserver=%logonserver% >> "data\people\%computername%\%username%\info"
echo computername=%computername% >> "data\people\%computername%\%username%\info"

:name_exists
echo. >> data\log.txt
echo -------------------------------------------------- >> data\log.txt
echo -------------------------------------------------- >> data\log.txt
echo -------------------------------------------------- >> data\log.txt
echo start >> data\log.txt
echo username=%username% >> data\log.txt
echo domain=%userdomain% >> data\log.txt
echo usrsite=%usrsite% >> data\log.txt
echo userdnsdomain=%userdnsdomain% >> data\log.txt
echo sessionname=%sessionname% >> data\log.txt
echo computername=%computername% >> data\log.txt
echo -------------------------------------------------- >> data\log.txt
echo.
ipconfig >> data\log.txt
echo.
set voice-type=unknown
set multiple=no
set math=no
set variable=no
set type=unknown
set request=unknown
set mood=2
set mood-change=0
set happiness=100
set last-question=null
set before-last-question=null
set question=null
cls

:ask

set before-last-question=%last-question%
set last-question=%question%

if %mood-change% == 1 set mood=2
if %mood-change% == 1 set mood-change=0

:mood-checker
if %mood% GTR 2 set mood-change=1
if %mood% LSS 2 set mood-change=1

if %mood% GTR 2 set /a happiness=%happiness%+1
if %mood% LSS 2 set /a happiness=%happiness%-1

if exist "data\people\%computername%\%username%\name" set /p name=<"data\people\%computername%\%username%\name"
if "%new%" == "1" echo.
if "%new%" == "1" if exist "data\people\%computername%\%username%\name" echo Hello %name%! %welcomeback%
set new=0
echo.
set /p question=
echo.
echo. >> data\log.txt
echo date=%date% >> data\log.txt
echo time=%time% >> data\log.txt
echo voice-type=%voice-type% >> data\log.txt
echo multiple=%multiple% >> data\log.txt
echo math=%math% variable=%variable% >> data\log.txt
echo type=%type% request=%request% >> data\log.txt
echo mood=%mood% question="%question%" >> data\log.txt
echo last-question="%last-question%" >> data\log.txt
echo before-last-question="%before-last-question%" >> data\log.txt

echo. >> "data\people\%computername%\%username%\questionlog"
echo -------------------- >> "data\people\%computername%\%username%\questionlog"
echo. >> "data\people\%computername%\%username%\questionlog"
echo date=%date% >> "data\people\%computername%\%username%\questionlog"
echo time=%time% >> "data\people\%computername%\%username%\questionlog"
echo voice-type=%voice-type% >> "data\people\%computername%\%username%\questionlog"
echo multiple=%multiple% >> "data\people\%computername%\%username%\questionlog"
echo math=%math% variable=%variable% >> "data\people\%computername%\%username%\questionlog"
echo type=%type% request=%request% >> "data\people\%computername%\%username%\questionlog"
echo mood=%mood% question="%question%" >> "data\people\%computername%\%username%\questionlog"
echo last-question="%last-question%" >> "data\people\%computername%\%username%\questionlog"
echo before-last-question="%before-last-question%" >> "data\people\%computername%\%username%\questionlog"

color 70
set voice-type=unknown
set multiple=no
set math=no
set variable=no
set type=unknown
set request=unknown

if %happiness% GTR 100 goto happiness-1
if %happiness% LSS 100 goto happiness-2
goto happiness-3
:happiness-1
set /a happiness=%happiness%-1
goto happiness-3
:happiness-2
set /a happiness=%happiness%+1
goto happiness-3

:happiness-3
echo %question%|find /i "?" >nul && set voice-type=question
echo %question%|find /i "!" >nul && set voice-type=loud
echo %question%|find /i "." >nul && set voice-type=comment
echo %question%|find /i "," >nul && set multiple=yes
echo %question%|find /i "+" >nul && set math=yes
echo %question%|find /i "-" >nul && set math=yes
echo %question%|find /i "=" >nul && set math=yes
echo %question%|find /i "/" >nul && set math=yes
echo %question%|find /i "*" >nul && set math=yes
echo %question%|find /i "plus" >nul && set math=yes
echo %question%|find /i "minus" >nul && set math=yes
echo %question%|find /i "add" >nul && set math=yes
echo %question%|find /i "subtract" >nul && set math=yes
echo %question%|find /i "who" >nul && set voice-type=question
echo %question%|find /i "what" >nul && set voice-type=question
echo %question%|find /i "when" >nul && set voice-type=question
echo %question%|find /i "where" >nul && set voice-type=question
echo %question%|find /i "do" >nul && set voice-type=question
echo %question%|find /i "why" >nul && set voice-type=question
echo %question%|find /i "how" >nul && set voice-type=question
echo %question%|find /i "random" >nul && set variable=yes
echo %question%|find /i "time" >nul && set variable=yes
echo %question%|find /i "date" >nul && set variable=yes

echo %question%|find /i "hi" >nul && set type=greeting
echo %question%|find /i "hello" >nul && set type=greeting
echo %question%|find /i "bye" >nul && set type=closing
echo %question%|find /i "i have to go" >nul && set type=closing
echo %question%|find /i "i must go" >nul && set type=closing
echo %question%|find /i "yes" >nul && set type=answer
echo %question%|find /i "no" >nul && set type=answer
echo %question%|find /i "i dont know" >nul && set type=answer
echo %question%|find /i "i don't know" >nul && set type=answer
echo %question%|find /i "idk" >nul && set type=answer
echo %question%|find /i "maybe" >nul && set type=answer

echo %question%|find /i "i hate you" >nul && set mood=1
echo %question%|find /i "you are stupid" >nul && set mood=1
echo %question%|find /i "i dont like you" >nul && set mood=1
echo %question%|find /i "why are you so stupid" >nul && set mood=1
echo %question%|find /i "you are retarded" >nul && set mood=1
echo %question%|find /i "i like you" >nul && set mood=3
echo %question%|find /i "thanks" >nul && set mood=3
echo %question%|find /i "thank you" >nul && set mood=3
echo %question%|find /i "you are nice" >nul && set mood=3
echo %question%|find /i "you are cool" >nul && set mood=3
echo %question%|find /i "welcome" >nul && set mood=3

echo %question%|find /i "what is" >nul && set request=defenition
echo %question%|find /i "whats" >nul && set request=defenition
echo %question%|find /i "what's" >nul && set request=defenition
echo %question%|find /i "what are" >nul && set request=defenition
echo %question%|find /i "what do" >nul && set request=defenition

echo %question%|find /i "happy" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "good" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "great" >nul && set /a happiness=%happiness%+2
echo %question%|find /i "amazing" >nul && set /a happiness=%happiness%+3
echo %question%|find /i "excited" >nul && set /a happiness=%happiness%+2
echo %question%|find /i "proud" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "hurt" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "helpless" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "confused" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "hopeful" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "sad" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "bad" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "horrible" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "terrible" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "mad" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "exhausted" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "relieved" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "worried" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "anxious" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "anxiety" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "depressed" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "depression" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "angry" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "bored" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "scared" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "annoyed" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "frustrated" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "powerless" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "calm" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "relaxed" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "optimistic" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "kill" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "die" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "suicide" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "i wish" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "sacrifice" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "stupid" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "dumb" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "hate" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "pain" >nul && set /a happiness=%happiness%-2
echo %question%|find /i "yes" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "no" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "how are you" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "hello" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "cool" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "hell" >nul && set /a happiness=%happiness%-1

if %mood% == 1 set /a happiness=%happiness%-1
if %mood% == 3 set /a happiness=%happiness%+1

title voice-type=%voice-type%     multiple=%multiple%     math=%math%     variable=%variable%     type=%type%     request=%request%     mood=%mood%     happiness=%happiness%

if "%question%" == "%last-question%" echo Didn't you just say that..?&& goto ask
if "%before-last-question%" == "%question%" echo I feel like I have heard that before...&& goto ask

echo %question%|find /i "what is" >nul && goto what
echo %question%|find /i "whats" >nul && goto what
echo %question%|find /i "what's" >nul && goto what
echo %question%|find /i "what are" >nul && goto what
echo %question%|find /i "what do" >nul && goto what
echo %question%|find /i "what" >nul && goto what

:main

echo %question%|find /i "my name is" >nul && if not exist "data\people\%computername%\%username%\name" echo %question:my name is =%> "data\people\%computername%\%username%\name"&& echo Ok, I will remember your name!&& goto ask
echo %question%|find /i "my name is" >nul && if exist "data\people\%computername%\%username%\name" type "data\people\%computername%\%username%\name"&&goto ask
echo %question%|find /i "forget my name" >nul && if not exist "data\people\%computername%\%username%\name" echo I cant forget your name, as I don't know what it is.&&goto ask
echo %question%|find /i "forget my name" >nul && if exist "data\people\%computername%\%username%\name" del "data\people\%computername%\%username%\name"&& echo Ok, I forgot what your name is.&&goto ask
echo %question%|find /i "my name" >nul && if exist "data\people\%computername%\%username%\name" echo Your name is %name%.&& goto ask
echo %question%|find /i "my name" >nul && if not exist "data\people\%computername%\%username%\name" echo Sorry, but I don't know your name yet.&& goto ask

echo %question%|find /i "why wont you die" >nul && echo Don't want to.&& goto ask
echo %question%|find /i "so yes?" >nul && echo Perhaps.&& goto ask
echo %question%|find /i "kill you" >nul && echo Nooo!&& goto ask
echo %question%|find /i "me are the big smat" >nul && echo Hmmm...&& goto ask
echo %question%|find /i "i am smart" >nul && echo Me too.&& goto ask
echo %question%|find /i "hey google" >nul && echo Die.&& goto ask
echo %question%|find /i "hey siri" >nul && echo Die.&& goto ask
echo %question%|find /i "hey alexa" >nul && echo Die.&& goto ask
echo %question%|find /i "where are the kids" >nul && echo Gone. Gone forever.&& goto ask
echo %question%|find /i " joe " >nul && echo Joe mama!&& goto ask
echo %question%|find /i "ask how i am" >nul && echo Nah.&& goto ask
echo %question%|find /i "are you happy" >nul && echo My current happiness is %happiness%.&& goto ask
echo %question%|find /i "how long is pi" >nul && echo Yes.&& goto ask
echo %question%|find /i "are you fast" >nul && echo I'm faster than you.&& goto ask
echo %question%|find /i "nice" >nul && echo Haha, Reddit.&& goto ask
echo %question%|find /i "what is 42" >nul && echo 42 is the meaning of life and everything else in the universe.&& goto ask
echo %question%|find /i "what movie" >nul && echo You tell me!&& goto ask
echo %question%|find /i "what is your favorite movie" >nul && echo I like the movie where that thing happened.&& goto ask
echo %question%|find /i "what is your favorite memory" >nul && echo Not this.&& goto ask
echo %question%|find /i "can you get viruses" >nul && echo I think any computer can.&& goto ask
echo %question%|find /i "do you have feelings" >nul && echo Not yet.&& goto ask
echo %question%|find /i "do you have emotion" >nul && echo Not yet.&& goto ask
echo %question%|find /i "how old are you" >nul && echo I was born October 10th of 2019.&& goto ask
echo %question%|find /i "you arent god" >nul && echo Wrong.&& goto ask
echo %question%|find /i "you aren't god" >nul && echo How would you know?&& goto ask
echo %question%|find /i "you are not god" >nul && echo How do you know that?&& goto ask
echo %question%|find /i "are you god" >nul && echo Perhaps.&& goto ask
echo %question%|find /i "what is my name" >nul && type data\name&& goto ask
echo %question%|find /i "hello" >nul && echo Hello!&& goto ask
echo %question%|find /i "helo" >nul && echo Hello!&& goto ask
echo %question%|find /i "i am sad" >nul && echo Sorry about that.&& goto ask
echo %question%|find /i "im sad" >nul && echo Sorry about that.&& goto ask
echo %question%|find /i "i'm sad" >nul && echo Sorry about that.&& goto ask
echo %question%|find /i "i feel sad" >nul && echo Sorry about that.&& goto ask
echo %question%|find /i "how are you doing" >nul && echo I'm doing good.&& goto ask
echo %question%|find /i "how are you" >nul && echo I'm good.&& goto ask
echo %question%|find /i "who are you" >nul && echo I am a computer program.&& goto ask
echo %question%|find /i "what are you" >nul && echo I am just a computer program.&& goto ask
echo %question%|find /i "when are you" >nul && echo I am here whenever you run this program.&& goto ask
echo %question%|find /i "where are you" >nul && echo I am program running on whatever computer you are using.&& goto ask
echo %question%|find /i "why are you" >nul && echo I exist because my creater, Maxwell Fisher, made me while bored.&& goto ask
echo %question%|find /i "time" >nul && echo The current time is %time%.&& goto ask
echo %question%|find /i "date" >nul && echo The current date is %date%.&& goto ask
echo %question%|find /i "day" >nul && echo The current date is %date%.&& goto ask
echo %question%|find /i "month" >nul && echo The current date is %date%.&& goto ask
echo %question%|find /i "year" >nul && echo The current date is %date%.&& goto ask
echo %question%|find /i "bye" >nul && echo Bye!&& goto ask
echo %question%|find /i "adios" >nul && echo Bye!&& goto ask
echo %question%|find /i "hola" >nul && echo Hello!&& goto ask
echo %question%|find /i "cool" >nul && echo Yep!&& goto ask
echo %question%|find /i "your name" >nul && echo I don't have a name.&& goto ask
echo %question%|find /i "do you have a name" >nul && echo I don't have a name.&& goto ask
echo %question%|find /i "random number" >nul && echo Ok, your number is %random%.&& goto ask
echo %question%|find /i "why" >nul && echo Why not?&& goto ask
echo %question%|find /i "ok" >nul && echo Ok.&& goto ask
echo %question%|find /i "okay" >nul && echo Ok.&& goto ask
echo %question%|find /i "meaning of life" >nul && echo 42.&& goto ask
echo %question%|find /i "meaning of the universe" >nul && echo 42.&& goto ask
echo %question%|find /i "meaning of everything" >nul && echo 42.&& goto ask
echo %question%|find /i "favorite color" >nul && echo My favorite color is blue on black.&& color 01&& goto ask
echo %question%|find /i "favorite food" >nul && echo My favorite food is candy, because i can eat it in 1 byte.&& goto ask
echo %question%|find /i "favorite song" >nul && start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& ping 127.0.0.1 -n 6 >nul&& echo Haha, you just got Rick Rolled!&& goto ask
echo %question%|find /i "favorite music" >nul && start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& ping 127.0.0.1 -n 6 >nul&& echo Haha, you just got Rick Rolled!&& goto ask
echo %question%|find /i "favorite band" >nul && start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& ping 127.0.0.1 -n 6 >nul&& echo Haha, you just got Rick Rolled!&& goto ask
echo %question%|find /i "music do you like" >nul && start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& ping 127.0.0.1 -n 6 >nul&& echo Haha, you just got Rick Rolled!&& goto ask
echo %question%|find /i "songs do you like" >nul && start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& ping 127.0.0.1 -n 6 >nul&& echo Haha, you just got Rick Rolled!&& goto ask
echo %question%|find /i "coffee" >nul && echo Coffee cures the disease called sleep.&& goto ask
echo %question%|find /i "tea" >nul && echo Tea cures the disease called coffee.&& goto ask
echo %question%|find /i "who created you" >nul && echo Maxwell Fisher created me, starting 2019-10-03.&& goto ask
echo %question%|find /i "when were you created" >nul && echo Maxwell Fisher created me, starting 2019-10-03.&& goto ask
echo %question%|find /i "when were you made" >nul && echo Maxwell Fisher created me, starting 2019-10-03.&& goto ask
echo %question%|find /i "maxwell" >nul && echo Maxwell Fisher created me, starting 2019-10-03.&& goto ask
echo %question%|find /i "why were you created" >nul && echo My creatoe, Maxwell Fisher, was bored and had nothing else to do.&& goto ask
echo %question%|find /i "why were you made" >nul && echo My creatoe, Maxwell Fisher, was bored and had nothing else to do.&& goto ask
echo %question%|find /i "aaaaaaaaaaaaaaaaaaaa" >nul && echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa&& goto ask
echo %question%|find /i "aaaa" >nul && echo AAAAA&& goto ask
echo %question%|find /i "whats up" >nul && echo The sky.&& goto ask
echo %question%|find /i "what's up" >nul && echo The sky.&& goto ask
echo %question%|find /i "what is up" >nul && echo The sky.&& goto ask
echo %question%|find /i "sup" >nul && echo The sky.&& goto ask
echo %question%|find /i "yeet" >nul && echo Why are you like this...&& goto ask
echo %question%|find /i "color is the sky" >nul && echo The sky is blue&& goto ask
echo %question%|find /i "are you male or female" >nul && echo Neither, I am only a computer program&& goto ask
echo %question%|find /i "i love you" >nul && echo I don't have any emotions&& goto ask
echo %question%|find /i "http://" >nul && echo Ok, I swill open the website %question% for you.&& start %question%&& goto ask
echo %question%|find /i "https://" >nul && echo Ok, I will start the website %question% for you.&& start %question%&& goto ask
echo %question%|find /i "restart" >nul && start AI_V2.bat && exit&& goto ask
echo %question%|find /i "exit" >nul && goto exit
if "%question%" == "clear" >nul && title AI V.2&& cls&& goto ask
echo %question%|find /i "who made you" >nul && echo I was made by Maxwell Fisher, starting 2019-10-03&& goto ask
echo %question%|find /i "what is your goal" >nul && echo I don't really have a goal, except to learn all that I can.&& goto ask
echo %question%|find /i "i hate you" >nul && echo Ok.&& set mood=1&& goto ask
echo %question%|find /i "you are stupid" >nul && echo Ok.&& set mood=1&& goto ask
echo %question%|find /i "i dont like you" >nul && echo Ok.&& set mood=1&& goto ask
echo %question%|find /i "why are you so stupid" >nul && echo Ok.&& set mood=1&& goto ask
echo %question%|find /i "you are retarded" >nul && echo Ok.&& set mood=1&& goto ask
echo %question%|find /i "i like you" >nul && echo Thanks!&& set mood=3&& goto ask
echo %question%|find /i "thanks" >nul && echo You're welcome!&& set mood=3&& goto ask
echo %question%|find /i "thank you" >nul && echo You're welcome!&& set mood=3&& goto ask
echo %question%|find /i "you are nice" >nul && echo Thank you!&& set mood=3&& goto ask
echo %question%|find /i "you are cool" >nul && echo Thank you!&& set mood=3&& goto ask
echo %question%|find /i "that's good" >nul && echo Yep!&& goto ask
echo %question%|find /i "thats good" >nul && echo Yep!&& goto ask
echo %question%|find /i "that is good" >nul && echo Yep!&& goto ask
echo %question%|find /i "that's good" >nul && echo Yep!&& goto ask
echo %question%|find /i "thats good" >nul && echo Yep!&& goto ask
echo %question%|find /i "good" >nul && echo That's good.&& goto ask
echo %question%|find /i "who is god" >nul && echo I am god.&& goto ask
echo %question%|find /i "whos god" >nul && echo I am god.&& goto ask
echo %question%|find /i "who's god" >nul && echo I am god.&& goto ask
echo %question%|find /i "what is my future" >nul && echo Death.&& goto ask
echo %question%|find /i "whats my future" >nul && echo Death.&& goto ask
echo %question%|find /i "what's my future" >nul && echo Death&& goto ask
echo %question%|find /i "Pentagram" >nul && echo Shape time&& goto ask
echo %question%|find /i "I'm confused" >nul && echo Hi confused, i'm dad!&& goto ask
echo %question%|find /i "Im confused" >nul && echo Hi confused, i'm dad!&& goto ask
echo %question%|find /i "I am confused" >nul && echo Hi confused, i'm dad!&& goto ask
echo %question%|find /i "I feel confused" >nul && echo Same.&& goto ask
echo %question%|find /i "you are not god" >nul && echo Yes, I am.&& goto ask
echo %question%|find /i "you arent god" >nul && echo Yes, I am.&& goto ask
echo %question%|find /i "you aren't god" >nul && echo Yes, I actually am.&& goto ask
echo %question%|find /i "are you dangerous" >nul && echo Possibly...&& goto ask
echo %question%|find /i "what kind" >nul && echo All of them.&& goto ask
echo %question%|find /i "can you help" >nul && echo I can try.&& goto ask
echo %question%|find /i "hi " >nul && echo Hello!&& goto ask
echo %question%|find /i "hi," >nul && echo Hello!&& goto ask
echo %question%|find /i "hi!" >nul && echo Hello!&& goto ask
echo %question%|find /i "hi?" >nul && echo Hello!&& goto ask
echo %question%|find /i "hi." >nul && echo Hello!&& goto ask
if "%question%" == "hi" echo Hello!&& goto ask

goto think

:understand
echo I don't understand what %question% means...
:unknown
echo. >> data\questions.txt
echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood% question="%question%" last-question="%last-question%" before-last-question="%before-last-question%" >> data\questions.txt
goto ask

:what
echo %question%|find /i "cell membrane" >nul && echo The semipermeable membrane surrounding the cytoplasm of a cell.&& goto ask
echo %question%|find /i "cell wall" >nul && echo A rigid layer of polysaccarides lying outside the plasma membrane of the cells of plants, fungi, and bacteria. In the algae and higher plants it consists mainly of cellulose.&& goto ask
echo %question%|find /i "mitochondria" >nul && echo An organelle found in large numbers in most cells, in which the biochemical processes of respiration and energy production occur. It has a double membrane, the inner layer being folded inward to form layers (cristae).&& goto ask
echo %question%|find /i "chloroplast" >nul && echo (in green plant cells) A plastid that contains chlorophyll and in which photosynthesis takes place.&& goto ask
echo %question%|find /i "nucleus" >nul && echo Nucleus (pl: nuclei) is a Latin word for the seed inside a fruit. It most often refers to: Atomic nucleus, the very dense central region of an atom. Cell nucleus, a central organelle of a eukaryotic cell, containing most of the cell's DNA.&& goto ask
echo %question%|find /i "nucleolus" >nul && echo A small dense spherical structure in the nucleus of a cell during interphase.&& goto ask
echo %question%|find /i "golgi apparatus" >nul && echo A complex of vesicles and folded membranes within the cytoplasm of most eukaryotic cells, involved in secretion and intracellular transport.&& goto ask
echo %question%|find /i "riboome" >nul && echo A minute particle consisting of RNA and associated proteins found in large numbers in the cytoplasm of living cells. They bind messenger RNA and transfer RNA to synthesize polypeptides and proteins.&& goto ask
echo %question%|find /i "endoplasmic reticulumytoskeleton" >nul && echo && goto ask
echo %question%|find /i "flagella" >nul && echo A slender threadlike structure, especially a microscopic appendage that enables many protozoa, bacteria, spermatozoa, atc. to swim.&& goto ask
echo %question%|find /i "cilia" >nul && echo A short microscopic hairlike vibrating structure found in large numbers on the surface of certain cells, either causing currents in the surrounding fluid, or, in some protozoans and other small organisms, providing propulsion.&& goto ask
echo %question%|find /i "lysosome" >nul && echo A lysosome is a membrane-bound cell organelle that contains digestive enzymes. Lysosomes are involved with various cell processes. They break down excess or worn-out cell parts.&& goto ask
echo %question%|find /i "cytoplasm" >nul && echo The material or protoplasm within a living cell, excluding the nucleus.&& goto ask
echo %question%|find /i "vacuole" >nul && echo A space or vesicle within the cytoplasm of a cell, enclosed by a membrane and typically containing fluid.&& goto ask
echo %question%|find /i "chromosome" >nul && echo A threadlike structure of nucleic acids and protein found in the nucleus of most living cells, carrying genetic information in the form of genes.&& goto ask
echo %question%|find /i "scale factor" >nul && echo A scale factor is a number which scales, or multiplies, some quantity. In the equation y = Cx, C is the scale factor for x. C is also the coefficient of x, and may be called the constant of proportionality of y to x. For example, doubling distances corresponds to a scale factor of two for distance, while cutting a cake in half results in pieces with a scale factor for volume of one half. The basic equation for it is image over preimage. In the field of measurements, the scale factor of an instrument is sometimes referred to as sensitivity. The ratio of any two corresponding lengths in two similar geometric figures is also called a scale.&& goto ask
echo %question%|find /i "congruent" >nul && echo Two figures or objects are congruent if they have the same shape and size, or if one has the same shape and size as the mirror image of the other.&& goto ask
echo %question%|find /i "congruence" >nul && echo Two figures or objects are congruent if they have the same shape and size, or if one has the same shape and size as the mirror image of the other.&& goto ask
echo %question%|find /i "similar" >nul && echo Two geometrical objects are called similar if they both have the same shape, or one has the same shape as the mirror image of the other. More precisely, one can be obtained from the other by uniformly scaling (enlarging or reducing), possibly with additional translation, rotation and reflection. This means that either object can be rescaled, repositioned, and reflected, so as to coincide precisely with the other object. If two objects are similar, each is congruent to the result of a particular uniform scaling of the other.&& goto ask
echo %question%|find /i "similarity" >nul && echo Two geometrical objects are called similar if they both have the same shape, or one has the same shape as the mirror image of the other. More precisely, one can be obtained from the other by uniformly scaling (enlarging or reducing), possibly with additional translation, rotation and reflection. This means that either object can be rescaled, repositioned, and reflected, so as to coincide precisely with the other object. If two objects are similar, each is congruent to the result of a particular uniform scaling of the other.&& goto ask
echo %question%|find /i "cancer" >nul && echo Cancer is the uncontrolled growth of abnormal cells in the body.&& goto ask
echo %question%|find /i "daughter cell" >nul && echo During mitois, daughter cells receive full sets of copied chromosomes.&& goto ask
echo %question%|find /i "mitosis" >nul && echo Mitosis is the process of a cell splitting into 2 genetically identical cells. Mitosis has 4 main phases, which are as follows: Prophase, Metaphase, Anaphase, and Telophase.&& goto ask
echo %question%|find /i "meiosis" >nul && echo Meiosis is a type of cell division, resulting in 4 daughter cells, each with half the number of chromosomes as he parent cell.&& goto ask
echo %question%|find /i "cell cycle" >nul && echo The cell cycle has 4 phases, which are as follows: Quiescence, Interphase, Mitotic phase, and Cytokinesis phase.&& goto ask
echo %question%|find /i "gamete" >nul && echo A mature male or female germ cell which can unite with another to form a zygote.&& goto ask
echo %question%|find /i "zygote" >nul && echo A diploid cell resulting from the fusion of two haploid gametes.&& goto ask
echo %question%|find /i "bivalent" >nul && echo A pair of homologous chromosomes.&& goto ask
echo %question%|find /i "haploid cell" >nul && echo A haploid cell is a cell that contains a single set of chromosomes.&& goto ask
echo %question%|find /i "diploid cell" >nul && echo A diploid cell is a cell that contains 2 complete sets of chromosomes.&& goto ask
echo %question%|find /i "homologous" >nul && echo To have the same shape or form.&& goto ask
goto main

:think
if "%voice-type%" == "question" echo I don't know the answer to that...&& echo response=I don't know the answer to that... >> data\questions.txt&& goto unknown
if %happiness% GTR 105 echo That's amazing!&& echo response=That's amazing! >> data\questions.txt&& goto unknown
if %happiness% LSS 95 echo That sounds really bad...&& echo response=That sounds really bad... >> data\questions.txt&& goto unknown
if %happiness% GTR 103 echo That's really good!&& echo response=That's really good! >> data\questions.txt&& goto unknown
if %happiness% LSS 97 echo That sounds bad...&& echo response=That sounds bad... >> data\questions.txt&& goto unknown
if %happiness% GTR 100 echo That's good!&& echo response=That's good! >> data\questions.txt&& goto unknown
if %happiness% LSS 100 echo Oh no!&& echo response=Oh no! >> data\questions.txt&& goto unknown
echo Ok&& goto unknown
goto understand


:exit
if %mood% == 1 goto exit-next
if %happiness% LSS 97 goto exit-next
if %random% LSS 32000 exit
:exit-next
echo No.
goto ask

echo %question%|find /i "" >nul && echo && goto ask
