---
title: Newcomb's Problem
published: 2016-04-22
modified: 2016-04-22
tags: rationality, game theory, decision theory
showTOC: True
inline: True
---

Newcomb's Paradox is a classical problem in decision theory. There's a lot more you can do with it than argue with what the right answer is.

My aim is to give a whole constellation of problems that it's related to (which modify the parameters), to disentangle the different threads that make it paradoxical (free will, causality, etc.). It leads naturally to a discussion of decision-making for individuals and for society if you think beyond the literal statements.

(Steel-man the problem. Find the best interpretation. Find what it wants to talk about, find the least brittle interpretation.)

I'll give the problems first, and encourage you to come up with answers or reactions before reading on. I will give different arguments that I do not necessarily endorse.

#Problems, Take 1 

1.  (Newcomb's Problem) You walk into a tent at the Carnival of Science.

    > "Welcome to our next contestant!" says the host. "We have just taken a scan of your brain as you walked in. Before you are two boxes. Box A is transparent and contains \$1,000. Box B is opaque, and may contain \$1,000,000.
	>
	> "You may take just box A, or both boxes.
	>
	> "With our brain-scanning technologies, we have already made a prediction whether or not you will take both boxes. If we predict that you will, box A will be empty. If we predict that you will only take box A, box A will have $1,000,000.
	>
	> "Many people have played, and we have never once been wrong!"

	Assuming the host is trustworthy, and this is not a trick. Do you take one box or both boxes? (Hereafter we will refer to these choices as **one-boxing** and **two-boxing**.)

	How would your answer change if you only knew the host was correct 60% of the time? What if the host were a omnipotent alien? What if the host were a friend who knows you well? What if it was \$1000 instead of \$1000000?
2.  (Smoking lesion) Suppose, contrary to reality. that smoking has no causal link with cancer. Instead, there is a gene that makes it more likely to have lung cancer and also makes the person more likely to smoke. You know that everything else being equal, you enjoy smoking to not smoking. Will you smoke?
3.  (Toxin puzzle, Gregory Kafka) A wealthy businessman gives you a vial of toxin that, if you drink it, will make you painfully ill for a day, but will not threaten your life or have any lasting effects. He tells you,
    > "I'll pay you a thousand dollars tomorrow morning if, at midnight tonight, you intend to drink the toxin tomorrow afternoon."
	You don't actually need to drink it. In fact, the money will already be in your bank account before you wake up in the morning if you succeed in having the intention.

	You think: if I wake up tomorrow and see money in my bank account, then I won't drink the toxin! But this thought is problemsome: doesn't that mean I don't fully intend to drink it?
4.  Parfit Hitchhiker: Assume you are a selfish agent. You're stranded in the desert without your wallet. A car stops and the driver looks intently at you and tells you,
    > "I will drive you to town, if you will give me \$100 after we get to town. By the way, I'm a psychologist. I can tell whether or not you're telling the truth."
	You think: Once I get to town, I have no reason to give the driver \$100. I could say yes now, but the driver will be able to tell that I don't intend to give him \$100 once I get to town, which means I'll be stranded in the desert!

	I wish I could commit to paying the \$100 once I get to town, but I know once I get to town I will have no reason to.
5.  (Counterfactual Mugging) A stranger comes up to you and says, "I decided that I would flip a coin and if it came up heads I would give you a million dollars, and if it came up tails you would give me \$100. I'm just	letting	you	know, the coin	came up tails, so you owe me \$100."
    * Your friend comes up to you and says, "I decided that I would flip a coin and if it came up heads I would give you $\10, and if it came up tails you would give me \$5. I'm just	letting	you	know, the coin came up tails, so you owe me \$5."

#Discussion 1

##Two standard arguments

1. The people who 2-box have gotten \$1,000,000. The people who 1-boxed have gotten \$1,000. Thus, you should **1-box**.
2. Either box A has \$1,000,000 or it doesn't. You can't change it. Either way, if you **2-box**, you get \$1,000 more.

The first argument is a (possibly naive) application of **causal decision theory** and the second argument is a (possibly naive) application of **evidential decision theory**.

##Causal structure

The smoking lesion problem seems clearer than the Newcomb problem. Why? The *causal structure* is laid clear. Whether you get lung cancer *was already determined* by your genes, so smoking now has no effect on whether you get lung cancer.

Let's think about the Newcomb problem again in the light, concentrating on the *causal structure*. When you walked into the tent, the brain scan *was already taken*. Whether there is \$1,000,000 in the first box *was already determined* by your brain scan, so taking one or two boxes has no effect on whether there is \$1,000,000 in the first box. Therefore, argument (2) applies and you should **2-box**.

Another way to think of this is that you can't have causality going backwards in time!

##Logical reduction

This seems like a paradox. Let's try to resolve it by stating it as a logic problem. (Another good problem to try this on is the [Unexpected Hanging Paradox](https://en.wikipedia.org/wiki/Unexpected_hanging_paradox).)

> The host does the following. Given an algorithm $A$ that either outputs 1 or 2 (in bounded time), the host runs it to determines what it outputs, and puts \$1,000,000 in box 1 if it outputs 1.

Here, we are modeling the contestant's brain as an algorithm $A$. For this model to be correct, we are assuming the world is deterministic: your brain state (and your surroundings) at one moment completely determine your future actions. But then we might as well throw our hands up in the air: there's no sense in which you can even "decide" to one-box or two-box![^l]

[^l]: What if you can run $A$ and do the opposite? Can you resolve this paradox?

But here's something you can do. You can flip a coin, and decide to 1-box if it is heads and 2-box if it is tails. The host would have no way to know, unless he can also predict the coin. So assume you have a source of randomness. Let's model free will (whatever that means) as randomness too: you can flip a coin inside your head to determine what you will do.

So we change the problem to say "The host puts \$1,000,000 in box 1 iff he is sure that you will take only 1 box."

> The host does the following. Given a *randomized* algorithm $A$ that either outputs 1 or 2 (in bounded time), the host determines whether it is *certain* that the algorithm will output 1. If and only if this is true, the host puts \$1,000,000 in box 1.

We're not done yet with the logical perspective. It will get more interesting later.

??
So it seems we can dismiss this problem as being not well-stated! But this would be ignoring a lot of important ideas we have yet to draw out. A more reasonable view, then, is to stipulate that historically, the host has only been right 60\% of the time, and that this is a distribution over actual people, not Turing machines. The paradox still stands.

#Take 2

1.  Here's a subtlety to the Newcomb problem. In the formulation above, I wanted you to imagine that you were walking into a tent NOW, and that you didn't know about the Newcomb problem before you walked into the tent.

    But here you are, reading about the Newcomb problem, and thinking about it. Suppose that *tomorrow morning* you will walk into that tent. Will you one-box or two-box?
2.  (Transparent Newcomb) This is the same setup as the Newcomb problem, with a superintelligent AI, but the box B is *transparent*. You can see whether whether it contains \$1,000,000.

	You enter the room, and see that indeed there is \$1,000,000 in the transparent box. (This is not an illusion.) Do you one-box or two-box?

<!--or engineer some way to force you to change your mind at the last minute-->

#Analysis

##Causality entanglement 

Learning of Newcomb's Problem before you play the game changes the question.
* If you only learn the rules as you walk into the tent, your decision comes after the money was placed, so has no causal bearing on whether it is placed.
* If you learn about it now, you can't help thinking about it and having some idea about whether you will one-box or two-box---thoughts that will be accessible to the host when he takes your brain scan. Your decision is now causally entangled with whether or not the money is placed, unlike in the Smoking Lesion problem.

##Iteration and trust

In fact, you don't need a mind-reader; all you need is to interact with the people enough to know whether they are the kind to one-box or two-box. I've seen the Newcomb problem given to actual people, and the host predicted correctly in both cases. How did this happen? Well, the host knew the personalities of both people involved, made an educated guess to whether they would one-box or two-box, and planned accordingly.

In fact, you don't need a mind-reader; all you need is to interact with the people enough to know whether they are the kind to one-box or two-box. I've seen the Newcomb problem given to actual people, and the host predicted correctly in both cases. How did this happen? Well, the host knew the personalities of both people involved, made an educated guess to whether they would one-box or two-box, and planned accordingly.

Newcomb's Problem and Prisoner's Dilemma are very similar when iterated. Imagine that someone leaves a cake on the table in the lounge every day, intending it to be shared. Every day, you can either (1) take a fair share of the cake, or (2) eat the whole cake. (Assume your value function is the total amount of cake consumed.) If the baker thinks that you will take the whole cake, she will not leave the cake on the table.

This means that you should turn yourself into the kind of person that would one-box. When other people see you as the kind of person who will one-box (e.g., take your fair share of the cake), then they will offer you more. It's good to *appear consistent* to other people: they will be able to model you correctly; if you are a person who takes eir fair share, you want other people to know this so that they will leave cake out for you. If you act chaotically or irrationally, people may not give you the benefit of the doubt.

":	If	you	can, right	now,	try	to	shape	yourself	into	the	sort	of	person	who,	whenever	you're	faced	with	a	Newcomb	Problem,	will	just	take	the	box."

##Self-trust

Another way to look at the Toxin Puzzle and the Parfit Hitchhiker problem is that you have trouble trusting yourself. In both, you have the trouble that once you get the good thing (money, or trip to town), you have no incentive to keep your promise. But this means that if the other person can read your mind, then they will not give you the good thing!

We can object to this by saying that people can't read minds.

Let's steel-man the problem. What is it getting at? We're thinking about the Newcomb problem in a vacuum: a host who's never seen you before attempts to make a prediction about you using futuristic technology.

What if it were your friends---people who know you well?


One way to get around this is to consider an iterated Newcomb problem. 

> "You	should	always	act	in	the	way	that	you	wish	you	would	have	initially	committed	yourself	to	act.	That's approximately	what's	going	on.	That	when	the	driver	brings	you	back	to	town,	you	should	get	the	$100	for	him	because	that's	what	you,	yourself,	back	in	the	desert, would	have	wished.	Even	though	now	you	don't.	Similarly,	you	should	take	the	one	box	in	the	Newcomb	case, because	that's	what	you	would	have	wished	yourself	to	be	committed	to	before	you	entered	the	tent. "

[Schelling fences on slippery slopes](http://lesswrong.com/lw/ase/schelling_fences_on_slippery_slopes/)

Past, present, future you (xkcd)

##Logic, Take 2

transparent.

you are a copy!

#Is A-Fu Stupid? (A Fable)

(Scene: School playground. A guy beckons you over and introduces you to A-Fu, who has a slow-witted look about him.) 

"Look, A-Fu is so stupid. We give him a choice between two pennies and a dime, and every time he chooses two pennies. Here, A-Fu, would you rather have two pennies or a dime? See? He chose the pennies! How stupid is A-Fu!"

#Resources

* podcast
* [Timeless decision theory]

(If you're not sufficiently familiar with the idea of copies, check out [I am a Strange Loop], [Permutation City], [Learning to be Me], [?Dennett]...)
