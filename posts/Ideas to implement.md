---
title: Ideas to implement
published: 2017-08-07
modified: 2017-08-07
tags: ideas, open_gestalts, under_construction, good_idea
type: uncategorized
showTOC: True
---



Back to [Open gestalts](Open gestalts.html)

Some good ideas that I'd love to see implemented. (I would do them, if I were more of a hacker and had time to spare. Let me know if you're interested in helping make any of these work!)

See a list of ideas by many people at [http://hackathonprojects.tk/](http://hackathonprojects.tk/)

#Collaborative learning

## Three wikis
These wikis are designed to help learners navigate new subjects.

+ Point of view: It's important not just to gain more knowledge, but to learn different perspectives on how to view the world. Unfortunately, many people rarely discuss the ways in which they think -- because we naturally forget how we learned to think the way we do (see The Emotion Machine, Minsky, Ch. 7), and when people in the same profession talk, they have no need to make explicit their common way of thinking. Let's start a collaborative effort to map out how different people view the world. The hope is that by making explicit the different viewpoints you learn in each "affinity group," any person can more easily learn the corresponding subject, as well as collaborate with people of different professions. (Of course, the only way to really learn anything is by doing.) (Multiple perspectives are encouraged -- it's fine to have disagreements.)
+ Learning: A discussion of ways to learn -- concretely, what works and what doesn't (for example, as in Scott Young's blog, but with more varying viewpoints) -- as well as some philosophic aspects. 
+ [Math road maps](Math road maps.html): How to approach learning different math subjects. The aim isn't to be encyclopedic like Wikipedia, but rather give a "road map" of what the essential questions in a subject are, the canonical books with discussion of their advantages and disadvantages, and current research questions. I think of it as a combination of the Princeton Companion to Mathematics (giving a lot of perspectives, "big ideas," and motivations; following a specific example as a story thread, etc.) and math book review sites (see a list at [Math books](Math books.html)). Example I started for number theory: [https://docs.google.com/document/d/1KTz2qJd7yUq32P1Kq4WQ2Y4NPWPnxBrkbOI6j487BEM/edit?usp=drive_web](https://docs.google.com/document/d/1KTz2qJd7yUq32P1Kq4WQ2Y4NPWPnxBrkbOI6j487BEM/edit?usp=drive_web) For people who are well-learned in a subject, list the materials that took you there (books, online resources, people, etc.) (The focus is less on recreating material that already exists, and more on mapping material that is already out there.)

And another one:

+ A theorem/proof (with guiding text) wiki: The idea is to modularize mathematics. Like in the Stacks Project, we can see the dependencies. Allow a user to create a (remixable) textbook by combining various theorems into one thread. Modularize by type (theorem/proposition/proof/remark/motivation/example, etc.) and by arguments used (see [Gowers's list](http://gowers.tiddlyspace.com/#%5B%5BOrganizing%20an%20open%20maths%20notebook%5D%5D%20GettingStarted%20%5B%5BA%20proof%20that%20a%20certain%20lift%20is%20not%20Ramsey%5D%5D)). Multiple representations are key: have alternate proofs. Label everything.

##cMOOC-type ideas
+ Start a [cMOOC for math](cMOOC for math.html), in the same spirit as ds106. **IMPORTANT -- WRITE UP IDEA SOMETIME**

#Programming

+ Program an AI for Hanabi. Have it follow the conventions and use human style deductive reasoning (imagining how the next turns will unfold and using that to update its play). Unlike other games this kind of deductive reasoning would actually help (rather than just doing something like minimax). See [http://boardgamegeek.com/thread/939952/hanabi-style-game-online-play](http://boardgamegeek.com/thread/939952/hanabi-style-game-online-play) and [https://github.com/Quuxplusone/Hanabi.](https://github.com/Quuxplusone/Hanabi.)

+ Program a 2-D adventure game engine in Elm, and then build games on top of it. (Start with a clone of something, ex. BlockWorld.) The functional style makes it easy to specify the behavior of different actors. Make it Turing-complete (cf. Minecraft, Dwarf Fortress). Add a premise/story (ex. Nell's story in The Diamond Age). See [https://github.com/holdenlee/elm.](https://github.com/holdenlee/elm.)

+ Formalize "problem-solving" type problems (e.g. Engel) in Coq, and write an automated theorem prover in Gallina to try and solve those problems.

+ Create a (natural) language based on functional programming that "type-checks" and actually implement it in a programming language. (How can we build a parser if the sentences aren't perfect grammar? Check nearby possibilities?)

+ Build a Penultima server which allows users to submit their own rules for pieces by writing functions (e.g. Actor ->
 Location ->
 Maybe Board, i.e., given an actor and a location for it to move to, return Nothing if it is invalid and return the resulting board otherwise). For a game, the site chooses a random submitted rule for each of the pieces. Rules can be upvoted and downvoted (so they will appear more/less common). The site keeps track of which users have played with which rules to prevent repeats. (At the minimum allow standard fairy chess piece moves [http://en.wikipedia.org/wiki/Fairy_chess_piece.](http://en.wikipedia.org/wiki/Fairy_chess_piece.) For an implementation of a game in Haskell that also allows rule changes, see Nomyx [http://www.nomyx.net/.](http://www.nomyx.net/.)

+EveryDayOfYourLife: A site which asks you a number of questions every day, such as
    +Did you write today? (for writers!)
    +Did you ask a question today?
    +Did you get out of your comfort zone?
    +Were you open-minded?
    +What did you do wrong today, and how will you improve?
    +Summarize how you moved forward in your life today, in one line.
    +Etc., and records your answers. You choose the questions that it asks you, or they can come from a standard set. **Perhaps they can appear with probabilities too, because a way to surprise someone and get candid reflection is to ask a unexpected question the user has no canned answer to. This site accomplishes several things:
    +It motivates you to be on track towards your goals, by recording the number of yes’s in a row (COMBO!) and forcing you to say “No, I haven’t” when you failed to do something.
    +It forces you to reflect every day, and reflection results in self-improvement.
    +If you so desire, you can share your answers, and thus feel more connected to humanity. It’s especially interesting to see other answers to the same question. [You can “follow” people, etc.]
    +It gives you hope that you are making progress (or hints that you’re not), when you look over your answers over the past months and years.
        1.
<->
750words.com (see the Metadata feature)
        1.
<->
 The Illumination (book): every day one of the characters writes one statement about why he loves his wife, and they accumulate thousands of these sentences.


+ Backchannel for online lectures -- A simple customizable interface that has a video (possibly from YouTube) on one side and a list of questions and comments that people have about the video on the other side. At any time, a watcher can pause the video and type a question or comment, and it will be arranged chronologically in the document, with the video’s time stamp. People can upvote and downvote questions and comments. --This is a vast improvement over online lectures with no interactivity, and addresses several concerns over the “online lecture”-ification of classes as well as flipped classrooms: specifically, students cannot ask questions in real-time, and hence there is no personalization of the lecture, and no ability to go on interesting tangents. However, neither does in-person lecture accomplish this completely because there are too many people and one instructor. Now students get to ask ALL their questions, in a time-specific manner, and a teacher can address them during class (or by commenting on the questions). This also provides the instructor with very specific feedback to improve the online lecture. --Maybe some online courses already have this feature. (Does EdX do this? If this is an immediate improvement.) I imagine that someone could turn a YouTube video into a commentable video in this sense just by dropping a YouTube link at the website, possibly setting a password for students. This immediately makes the existing wealth of educational videos available vastly more powerful.
I imagine this extending to other media besides videos. What if we did the same for every major textbook, ordered by page number? Reading a textbook no longer has to be a very independent activity; you could be connected to the corpus of all questions and ideas that other people have had while reading the textbook. A reading group’s best friend!
(And what if we could make the comments/questions not linear, but graph-like?)
1.education #
<->
Piazza #
<->
TodaysMeet #
<->
Concrete Mathematics, Graham, Patashnik, Knuth (one of my favorite math books; they incorporated class comments into the margins of their textbook) ~holden1@mit.edu  

#Great ideas that exist that could use more support
+ Mathbookwiki
+ flooved
+ teachme (iPhone app by Alex Iriza to trade knowledge with other people)


