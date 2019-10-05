@echo off
color 70
title AI V.2
set voice-type=unknown
set multiple=no
set math=no
set variable=no
set type=unknown
set request=unknown
set mood=neutral
set /a happiness=100
cls
:ask
echo.
set /p question=
echo.
color 70
set voice-type=unknown
set multiple=no
set math=no
set variable=no
set type=unknown
set request=unknown
set mood=neutral
set /a happiness=100
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

echo %question%|find /i "i hate you" >nul && set mood=bad
echo %question%|find /i "you are stupid" >nul && set mood=bad
echo %question%|find /i "i dont like you" >nul && set mood=bad
echo %question%|find /i "why are you so stupid" >nul && set mood=bad
echo %question%|find /i "you are retarded" >nul && set mood=bad
echo %question%|find /i "i like you" >nul && set mood=good
echo %question%|find /i "thanks" >nul && set mood=good
echo %question%|find /i "thank you" >nul && set mood=good
echo %question%|find /i "you are nice" >nul && set mood=good
echo %question%|find /i "you are cool" >nul && set mood=good
echo %question%|find /i "welcome" >nul && set mood=good

echo %question%|find /i "what is" >nul && set request=defenition
echo %question%|find /i "whats" >nul && set request=defenition
echo %question%|find /i "what's" >nul && set request=defenition
echo %question%|find /i "what are" >nul && set request=defenition
echo %question%|find /i "what do" >nul && set request=defenition

echo %question%|find /i "happy" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "good" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "great" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "amazing" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "excited" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "proud" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "hurt" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "helpless" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "confused" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "hopeful" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "sad" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "bad" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "horrible" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "terrible" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "mad" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "exhausted" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "relieved" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "worried" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "anxious" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "anxiety" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "depressed" >nul && set /a happiness=%happiness%=-1
echo %question%|find /i "depression" >nul && set /a happiness=%happiness%=1
echo %question%|find /i "angry" >nul && set /a happiness=%happiness%=-1
echo %question%|find /i "bored" >nul && set /a happiness=%happiness%=-1
echo %question%|find /i "scared" >nul && set /a happiness=%happiness%=-1
echo %question%|find /i "annoyed" >nul && set /a happiness=%happiness%=-1
echo %question%|find /i "frustrated" >nul && set /a happiness=%happiness%=-1
echo %question%|find /i "powerless" >nul && set /a happiness=%happiness%=-1
echo %question%|find /i "calm" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "relaxed" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "optimistic" >nul && set /a happiness=%happiness%+1
echo %question%|find /i "kill" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "die" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "suicide" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "i wish" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "sacrifice" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "stupid" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "dumb" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "hate" >nul && set /a happiness=%happiness%-1
echo %question%|find /i "pain" >nul && set /a happiness=%happiness%-1


title voice-type=%voice-type%     multiple=%multiple%     math=%math%     variable=%variable%     type=%type%     request=%request%     mood=%mood%     happiness=%happiness%

echo %question%|find /i "what is" >nul && goto what
echo %question%|find /i "whats" >nul && goto what
echo %question%|find /i "what's" >nul && goto what
echo %question%|find /i "what are" >nul && goto what
echo %question%|find /i "what do" >nul && goto what

:main
echo %question%|find /i "what is my name" >nul && type data\name&& goto ask
echo %question%|find /i "do you know my name" >nul && type data\name&& goto ask
echo %question%|find /i "my name is" >nul && echo %question:my name is =% > data\name&& echo Ok, I will remember your name!&& goto ask
echo %question%|find /i "forget my name" >nul && echo Sorry, but I don't know your name yet. > data\name&& echo Ok, I will forget your name&& goto ask
echo %question%|find /i "hi" >nul && echo Hello!&& goto ask
echo %question%|find /i "hello" >nul && echo Hello!&& goto ask
echo %question%|find /i "helo" >nul && echo Hello!&& goto ask
echo %question%|find /i "my name" >nul && type data\name&& goto ask
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
echo %question%|find /i "favorite song" >nul && echo Haha, you just got Rick Rolled!&& start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& goto ask
echo %question%|find /i "favorite music" >nul && echo Haha, you just got Rick Rolled!&& start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& goto ask
echo %question%|find /i "favorite band" >nul && echo Haha, you just got Rick Rolled!&& start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& goto ask
echo %question%|find /i "music do you like" >nul && echo Haha, you just got Rick Rolled!&& start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& goto ask
echo %question%|find /i "songs do you like" >nul && echo Haha, you just got Rick Rolled!&& start https://www.youtube.com/watch?v=dQw4w9WgXcQ&& goto ask
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
echo %question%|find /i "clear" >nul && title AI V.2&& cls&& goto ask
echo %question%|find /i "who made you" >nul && echo I was made by Maxwell Fisher, starting 2019-10-03&& goto ask
echo %question%|find /i "what is your goal" >nul && echo I don't really have a goal, except to learn all that I can.&& goto ask
echo %question%|find /i "i hate you" >nul && echo Ok.&& set mood=bad&& goto ask
echo %question%|find /i "you are stupid" >nul && echo Ok.&& set mood=bad&& goto ask
echo %question%|find /i "i dont like you" >nul && echo Ok.&& set mood=bad&& goto ask
echo %question%|find /i "why are you so stupid" >nul && echo Ok.&& set mood=bad&& goto ask
echo %question%|find /i "you are retarded" >nul && echo Ok.&& set mood=bad&& goto ask
echo %question%|find /i "i like you" >nul && echo Thanks!&& set mood=good&& goto ask
echo %question%|find /i "thanks" >nul && echo You're welcome!&& set mood=good&& goto ask
echo %question%|find /i "thank you" >nul && echo You're welcome!&& set mood=good&& goto ask
echo %question%|find /i "you are nice" >nul && echo Thank you!&& set mood=good&& goto ask
echo %question%|find /i "you are cool" >nul && echo Thank you!&& set mood=good&& goto ask
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

goto think

:understand
echo I don't understand what %question% means...
echo. >> data\questions.txt
echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood%     "%question%" >> data\questions.txt
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
goto main

:think
if %happiness% GTR 105 echo That's amazing!&& echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood%     "%question%" >> data\questions.txt&& goto ask
if %happiness% LSS 95 echo That sounds really bad...&& echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood%     "%question%" >> data\questions.txt&& goto ask
if %happiness% GTR 103 echo That's really good!&& echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood%     "%question%" >> data\questions.txt&& goto ask
if %happiness% LSS 97 echo That sounds bad...&& echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood%     "%question%" >> data\questions.txt&& goto ask
if %happiness% GTR 100 echo That's good!&& echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood%     "%question%" >> data\questions.txt&& goto ask
if %happiness% LSS 100 echo Oh no!&& echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood%     "%question%" >> data\questions.txt&& goto ask
echo Ok&& echo %date% %time% voice-type=%voice-type% multiple=%multiple% math=%math% variable=%variable% type=%type% request=%request% mood=%mood%     "%question%" >> data\questions.txt&& goto ask
goto understand

:exit
if %random% LSS 30000 exit
echo No.
goto ask

echo %question%|find /i "" >nul && echo && goto ask
