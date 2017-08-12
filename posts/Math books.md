---
title: Math books
published: 2017-08-07
modified: 2017-08-07
tags: math, textbook, communication
type: uncategorized
showTOC: True
---



Back to [Math communication](Math communication.html)

*Note 1: This page is geared more towards advanced math books (college and beyond). For a more discussion of writing curriculum (that applies more at the grade school level), see [Writing curriculum](Writing curriculum.html). Obviously, there are differences between how you would write for someone who doesn't care for math vs. someone who is already motivated to learn math. However, a lot of the principles there still apply. *

*Note 2: I write "book" but the same criteria can apply for other mathematical writings.*

*Note 3: Note that not all criteria are applicable for all books. My focus is on books that are good to learn from, i.e., books that aspire to *teach* a subject rather than be a reference work for the subject.*

#1 What makes a math book good? A list of criteria
1.Technical content
    1. Mathematically correct and rigorous 
    1. Proves results in sufficient generality, rather than ad hoc or just the shortest route to a theorem (i.e., gives the reader flexible knowledge)
    1. At the correct level for the audience 
    1. Fills in enough level of detail in proofs 
    1. Clarity: in particular, doesn't try to sweep annoying arguments under the rug ("it is easy to see that")
1. Useful to learn from
    1. Gives motivations for material before presenting it, e.g., showing [proofs as obstacle avoidance](Proofs and stories as obstacle avoidance)
    1. Gives examples; shows how theorems can be applied 
    1. Shows connections to other subjects 
    1. Encourages readers to come up with interesting questions
    1. Gives a road map of threads to follow besides the current book
    1. Shows multiple viewpoints 
    1. Has relevant problems that help you learn the material, organized well (preferably with difficulty labels and with solutions that give the main ideas)
        1. Encourages reader to think about the material before giving the proofs and results
    1. Summarizes material for the reader, crystallize concepts and strategies, lets the reader know what (s)he should get out of a chapter
1. Aesthetics
    1. Enjoyable to read, shows the beauty of the subject
1. Meta
    1. Community around the book (ex. website, forum, errata)
If we just consider (1) technical content, then a lot of math books can be considered good. However, a small proportion of math books are good in the sense of also satisfying (2) useful to learn from and (3) aesthetics. (In particular, a lot of standard textbooks are good on (1) but weak on (2).) I've put some rather specific criteria in (2) above, which I'll explain more in Section 3. (I'll won't talk much about (1) because I think most people have a good idea what the criteria there entails.)

There is a tendency among mathematicians to discount mathematical writing as a skill that exists and is worth developing -- we often say "the math should speak for itself." As a result, many books are rated based on the *mathematics* they contain, rather than their *exposition* (or *teaching*). This is a reasonable tendency, as it takes a large amount of time to write a book that teaches well rather than just presents the material, but we should nevertheless establish standards for what makes a math book good in the teaching sense, rather just the information-capturing sense. I think a lot of people are content with hard-to-read math books, simply because they haven't seen examples of books that really try to teach.

##Disclaimer (not important: can skip)

*Possible objection: Good mathematicians don't have the time to write lengthy explanations for their work! It's silly to hold them to that standard, when it's the math that really matters. *

*Answer: I'm not going to say that "the [math] classics are bad because they don't teach the material well." There are multiple sides of what "good math" is (cf. Tao). The community will always respect prolific researchers who can't teach, and that's fine. What I'm saying is that mathematicians should also be respected for good writing and teaching. The people who come up with a result may be different from the people who end up explaining it the most lucidly, and we should respect those people in different ways.
People say "read the classics." This is true in the sense that when people rewrite the classics (a) they may tend to omit things they might not fully understand, or that aren't pertinent to the course, and (b) while it's hard to capture the problem-solving method in text, the original often does it more faithfully than later texts. But this does not have to be the case.*

#2 Examples: My favorite math books and why they're good
(As [Professor Winston](What I learned from Patrick Winston) said, you shouldn't just like things, you should think about why you like them.)
My favorite math books are the following. (I'm sure there are many other good math books I haven't read. I would be glad to add your recommendations to the list. Just send me an email and give a reason why. The reason should involve the exposition and not the technical content.)
+ Algebra, Artin: Simply for its clarity and wealth of examples. It's a big book but easy to read through with a solid high school background. 
+ Algebraic Geometry, Ravi Vakil (from his Stanford course, [http://math.stanford.edu/~vakil/216blog/](http://math.stanford.edu/~vakil/216blog/)): gives intuition for a very difficult subject and especially why the definitions are the way they are, and asks the reader to perform a lot of exercises that are not mathematically hard but conceptually enlightening. (I'm still working my way through this one.)
+ Art of Problem Solving series: The books ask readers to solve problems to discover the main concepts for themselves. They crystallize key concepts, point out warnings, and give techniques at the end of every chapter.
+ Concrete Mathematics, by Graham, Knuth, and Patashnik: The book focuses on problem-solving; the tone is conversational: it makes sense to try x, oh this doesn't work because of y, what's the new idea z we need? I.e., it follows the philosophy given here: [Proofs and stories as obstacle avoidance](Proofs and stories as obstacle avoidance.html). There's also a strong focus on the computer science (Read about Knuth's philosophy on why it's good to learn math with a programming perspective: [http://holdenlee.wordpress.com/2013/09/26/mathematical-people/])
+ Information Theory, Inference, and Learning Algorithms, McKay (available at [http://www.inference.phy.cam.ac.uk/itprnn/book.html](http://www.inference.phy.cam.ac.uk/itprnn/book.html)): Has problems/puzzles that highlight key concepts BEFORE the key concepts are introduced, so that the reader might half-come up with them beforehand. For example, McKay introduces the puzzle of weighing coins to find the odd one out to introduce the idea of information as differentiation. As the title suggests, it also bridges the two related areas of information theory and machine learning.
+ Primes of the form x^2+ny^2: Takes a concrete problem and explores how several different areas of math help us solve the problem. In doing so it draws connections between different areas of math. (Most books do the opposite: show one area of math and don't talk about the interesting problems as much.)
+ Proofs from the Book, Andreescu and Dospinescu: Challenging and beautiful problems. The chapters form meaningful threads. They've set up an AoPS forum discussing the problems in the books, too (Meta).
+ Topology, Munkres: One of the clearest books I've seen.
+ Theory of Computation, Sipser: Presents the ideas/motivations in the proofs. Often he does a "baby case/example" first that shows a new idea in a transparent way, before giving the full proof (which may involve some other confounding elements).

#3 What makes a book useful to learn from?
I'll explain some of the criteria I gave above which may not seem standard. I think a lot of these points are not that hard to implement, but should be done more widely.

+ Gives motivations for material before presenting it.

Good books start each chapter saying why the material is important (i.e., with an "empowerment promise"). They motivate proofs by showing them as [obstacle avoidance](Proofs and stories as obstacle avoidance). One good way to do this is by Socratic questioning (which I feel is an underutilized way of presenting material in textbooks). Each step should be natural, and the intellectual leaps (places where a new idea is necessary) should be pointed out.

+ Gives examples; shows how theorems can be applied 
+ Shows connections to other subjects 

Readers who are interested in different areas or subareas of math (or physics, etc.) will end up reading the same book, so a book that shows connections between different subjects is of wider interest, and helps disseminate ideas more.

+ Encourages readers to come up with interesting questions
+ Gives a road map of threads to follow besides the current book

The ultimate goal of many a student is research, and an important part of research is learning how to come up with questions. Math is *about* thinking and asking questions. Thus, a book that presents some open problems, and alludes to interesting material for further study (with references), is preferable to one that gives a solution to every problem that it proposes. A book introducing a subject has the responsibility of establishing *what are the questions worth studying* in that subject.

+ Shows multiple viewpoints 

cf. Feynman: *"every theoretical physicist who is any good knows six or seven different theoretical representations for exactly the same physics. He knows that they are all equivalent, and that nobody is ever going to be able to decide which one is right at that level, but he keeps them in his head, hoping that they will give him different ideas for guessing."*

+ Encourages intuition

Although math is written down rigorously, the process of doing math is anything but, and relies heavily on intuition. Some books leave out intuitive statements -- presumably because some think that there's no room in a math book for non-rigorous statements. However, these fuzzy statements can be extremely useful in thinking about the subject. To provide this intuition, one can use visceralization and metaphor (See Scott Young on [holistic learning](http://www.scotthyoung.com/blog/Programs/HolisticLearningEBook.pdf)). Metaphors can be powerful in thinking about very abstract ideas (for example, an ultrafilter is in some ways like a voting system). For another example, see [http://betterexplained.com/articles/an-interactive-guide-to-the-fourier-transform/.](http://betterexplained.com/articles/an-interactive-guide-to-the-fourier-transform/.)

+ Has relevant problems that help you learn the material, organized well (preferably with difficulty labels and with solutions that give the main ideas)
    + Encourages reader to think about the material before giving the proofs and results

A lot of textbooks suffer from too many *unlabeled* problems -- if you specialized in the area had time to do everything, that would be alright, but most people don't. Thus a book should give guidance on (a) which problems are most important to do if you had limited time, (b) how difficult they are, and (c) why the problems are natural or important (ex. what ideas they lead on to). The typical way to do this is by starring certain problems and giving ratings (for example, see the system in Knuth's Art of Computer Programming). For a good example, see the McKay reference in the previous section.

Scaffolding is good but the wrong way to do scaffolding is to take a difficult result given as a problem, and break it up into baby components (a), (b), ... (k) and not give the motivation for breaking it up as such. Rather motivate the leaps in the same way as proofs are motivated.

*Possible objection: Problems in research have no difficulty labels assigned to them. Therefore, to prepare students for research, problems in textbooks should not be given difficulty labels.*
Answer: On the contrary, because research is difficult enough, we should make the process of learning existing material easier. This doesn't mean watering down material and exercises; it just means organizing the material and exercises in a way that enables the reader to get to the hard stuff faster.

+ Summarizes material for the reader, crystallize concepts and strategies, lets the reader know what (s)he should get out of a chapter

My grade school textbook had several features which were missing from many later textbooks. They start each chapter and section with "In this chapter/section you will learn...", and they put key ideas that I'm supposed to remember in boxes. I know what I'm supposed to have learned from a chapter or section.

Obviously this can be done badly, but when done well it is incredibly useful. The Art of Problem Solving textbooks do this quite well. Some might object that this seems infantile for a college textbook, but I don't think it is -- the summary is not meant to be an exhaustive list of everything that you've learned, either, because everyone might take away something a little different. Summaries and good indexing makes it easy to find information (both for a serious student and someone just browsing the book), and it's less likely a reader will read a chapter and forget everything about it.

A further note on "crystallization": Things that act like propositions, lemmas, and theorems should be labeled as such (rather than just given a cursory treatment in paragraph form), because it makes referring to them again easy. A logical next step to take less rigorous things such as principles and strategies and write them in as modular form as possible (see the AoPS texts, for instance).

#4 Aesthetics

+ Aesthetics
    + Enjoyable to read, shows the beauty of the subject

The book tries to convey the author's enthusiasm for the subject, and shows some of its intrinsic beauty rather than just proving results that help in proving other results. One good way is to present math is by using the lens of story; see the next post in this installment, [Math as stories](Math as stories.html).

#5 Meta

There's a lot to say here, but this will have to be a topic for another post.


