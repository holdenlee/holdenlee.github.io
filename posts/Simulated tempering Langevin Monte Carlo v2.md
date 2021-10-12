---
title: Sampling from multimodal distributions by raising the temperature
subtitle: Rong Ge, Holden Lee, Andrej Risteski
published: 2018-11-08
modified: 2018-11-08
parent: 
tags: math
type: uncategorized
showTOC: True
---

Many probability distributions that arise in practice are multimodal and hence challenging to sample from. One popular way to overcome this problem is to use *temperature-based* methods. In this post I describe work with Rong Ge and Andrej Risteski (in NIPS 2018) which gives rigorous guarantees for a temperature-based method called **simulated tempering** when applied to simple multimodal distributions.
<!-- I address this problem by proving that a *temperature-based* algorithm efficiently samples from simple multimodal distributions.
In this post I describe work with Rong Ge and Andrej Risteski on an algorithm that provably samples from certain multimodal distributions. -->
For more information, check out the [paper](https://arxiv.org/abs/1710.02736), [slides](https://www.dropbox.com/s/44udkqyd2r95qzk/slides_IAS.pdf?dl=0), [talk transcript](https://dynalist.io/d/wW7edPHuU41y1qxWAI0fL__c#z=c2y7iGMb-rjqoGupMLQ1DAWe), and [poster](https://www.dropbox.com/s/nvh4g055lyx9yth/poster_bayesian.pdf?dl=0).

We address the following fundamental problem in theoretical computer science and Bayesian machine learning:

> Sample from a probability distribution with density function $p(x) = \frac{e^{-f(x)}}{\int_{\R^n} e^{-f(x)}\,dx}$, $x\in \R^d$, given query access to $f(x)$ and $\nabla f(x)$.

In the case where $f$ is convex (we say that the distribution $p(x)$ is **log-concave**), a classical Markov chain called **Langevin diffusion** gives an efficient way to carry out the sampling. Log-concavity is sampling analogue of convexity, and Langevin diffusion is the analogue of gradient descent: it is gradient descent plus Gaussian noise.

However, just as most interesting optimization problems are non-convex and often have multiple local minima, most intersting sampling problems - such as those arising from deep generative models - are not log-concave, and often have multiple modes.
We can't hope to solve the problem in full generality, but we can hope to find methods that work for a wider class of distributions, including some multimodal distributions. 
<!-- We show efficient sampling given a structural assumption on the distribution: that it is close to a mixture of gaussians with polynomially many components. -->

# Main result

<!-- The idea is as follows. -->
One general approach to sample from a probability distribution is to define a Markov chain with the desired distribution as its stationary distribution. This approach is called **Markov chain Monte Carlo**. However, in many practical problems, the Markov chain does not mix rapidly, and we obtain samples from only one part of the distribution.

<!-- We use two algorithmic tools: -->
Thus, our algorithm requires two ingredients:

1. **Langevin diffusion**, which is a generic chain for sampling given gradient access to the log-pdf of  the distribution, and
2. **Simulated tempering**, a heuristic for speeding up Markov Chains on multimodal distributions.

We cannot use Langevin diffusion by itself because it is a Markov chain with local moves that gets stuck in a local mode.

<center>
<img src="pics/not_mixing.png" width="50%" height="50%">
</center>

Instead, we create a meta-Markov chain (the simulated tempering chain) which *changes the temperature* to exponentially speed up mixing. To *raise the temperature* of a distribution means to smooth it out so that the Markov chain can more easily traverse the space. While temperature-based methods have been used heuristically, strong guarantees for them have so far been lacking. <!-- we give guarantees for when it speeds up mixing.-->

<center>
<img src="pics/mixing.png" width="50%" height="50%">
</center>

<!-- A common heuristic approach to deal with multimodal distribution is *temperature-based methods*. These methods depend on *raising the temperature* of the distribution, i.e., smoothing it out in some way, so that the Markov chain can more easily traverse the space. We use one such method, called **simulated tempering**. -->

We show that our algorithm allows efficient sampling given a structural assumption on the distribution: that it is close to a mixture of gaussians (of equal covariance) with polynomially many components. <!-- this is in some sense the prototypical multimodal distribution -->

Our main theorem is the following.

> **Theorem**: Let $p(x)\propto e^{-f(x)}$ be a mixture of gaussians, i.e., $$f(x)=-\log\pa{\sumo in w_i e^{-\fc{\ve{x-\mu_j}^2}{2\si^2}}}.$$ Suppose that $\si, \ve{\mu_j}\le D$ and we can query $f(x)$, $\nb f(x)$. There is an algorithm (based on Langevin diffusion and simulated  tempering), which runs in time $\poly(1/w_{\min},1/\si^2,1/\ep,d,D)$ and samples from a distribution $\wt p$ with $\ve{p-\wt p}_1\le \ep$.

Moreover, this theorem is robust in the following sense: if $p(x)$ is a factor of $K$ away from a mixture of gaussians, then we incur an additional factor of $\poly(K)$ in running time. The theorem also extends to a mixture of strongly log-concave distributions of the same shape; we discuss the gaussian case for simplicity.

The main technical ingredient is a theorem giving criteria under which a simulated tempering Markov chain mixes. This is not tied to Langevin diffusion, and can also be applied to Markov chains on other spaces.[^other]

[^other]:  For example, we could consider distributions in $\{0,1\}^d$. Here, correlation decay plays a similar role to log-concavity in $\R^n$ in allowing a simple Markov chain, the Gibbs Markov chain, to mix rapidly.

Below, I give some motivation for the problem, describe the algorithm that we use, and sketch the proof of the theorem.

<!--
what's wrong with this sentence? 
Sampling is a fundamental task in Bayesian statistics, and dealing with multimodal distributions is a core challenge.  
One common technique to sample from a probability distribution is to define a Markov chain with that distribution as its stationary distribution. This general approach is called **Markov chain Monte Carlo**. However, in many practical problems, the Markov chain does not mix rapidly, and we obtain samples from only one part of the distribution.

Practitioners have dealt with this problem through heuristics involving temperature. *Raising the temperature* of a distribution means smoothing it out in some way, so that it is easier to traverse the space. While these methods are intuitive, there has been little theoretical analysis of such methods. We give general conditions under which one such method, called *simulated tempering*, mixes rapidly, and then show that it can give the first polynomial-time guarantees in a certain multimodal setting. 
-->

# Motivation

The typical scenario of interest in machine learning is sampling from the posterior distribution over the parameters or latent variables in a Bayesian model. Examples include gaussian mixture models, topic models (latent Dirichlet allocation), stochastic block models, and restricted Boltzmann machines. Given a prior $p(h)$ over the parameters or latent variables $h$, and a model $p(x|h)$ for how the observables $x$ are generated from $h$, we wish to calculate the posterior distribution of $h$ after observing many data points $x_1,\ldots, x_N$. The posterior distribution is given by Bayes's Rule: 
$$p(h|x_1,\ldots, x_N) \propto p(x_1,\ldots, x_N|h)p(h).$$

Even for simple models, the posterior is multimodal. Consider the simple example of a mixture of $m$ gaussians with unknown means $\mu_j$ and unit variance, where each point is equally likely to be drawn from each cluster. Suppose we observe data points $x_1,\ldots, x_N$. Then the posterior update $p(x_1,\ldots, x_n|\mu_1,\ldots,\mu_j)$ is proportional to $\prod_{n=1}^N \pa{\sumo jm \rc m \exp\pa{-\fc{\ve{x_n-\mu_j}^2}2}}$. This expands to a sum of exponentially many gaussians, which is multimodal in the $\mu_j$.

<!--
[^poly]

[^poly]: Because there are exponentially rather than polynomially many gaussians, our theorem does not apply in this case. However, we hope that our techniques may be built upon to provide guarantees for probability distributions which arise in practice.
-->

## Connections to optimization

<!-- Because of various connections between sampling and optimization, the sampling problem is relevant even when the end goal is optimization. 

First, note that t
-->

The story for sampling parallels the story for optimization. In optimization, the problem is to find the minimum of a function $f$. When $f$ is *convex*, there is a unique local minimum, so that local search algorithms like *gradient descent* are efficient. When $f$ is non-convex, gradient descent can get trapped in one of many local minima, and the problem is NP-hard in the worst case. However, gradient descent-like algorithms often still well in practice, suggesting that we can achieve better results by taking into account the structure of real-world problems.

Similarly, in sampling, when $f$ is *log-concave*, the distribution is unimodal and a natural Markov chain called *Langevin diffusion* (which is gradient descent plus noise) mixes rapidly. When $f$ is non-log-concave, Langevin diffusion can get trapped in one of many modes, and the problem is #P-hard in the worst case. However, sampling algorithms can still do well in practice, with the aid of heuristics such as temperature-based methods. 

Modern sampling problems arising in machine learning are typically non-log-concave. Like in nonconvex optimization, we must go beyond worst case analysis, and find what kind of structure in non-log-concave distributions allows us to sample efficiently.

The main observation connecting optimization and sampling is that if we sample from $e^{-f}$, we're more likely to get points where $f$ is small. Thus, sampling is useful even if one is only interested in optimization.
<!-- 
The primary connection between optimization and sampling is the following: if we sample from $e^{-f}$, we're more likely to get points where $f$ is small. 
We can take this to the extreme: In the limit as $\beta \to \infty$, the distribution $e^{-\beta f}$ is peaked at exactly the global minima. $\beta$ is called the inverse temperature ($\beta=\frac 1T$) in statistical physics. 
Some connections between optimization and sampling are:
-->
Langevin dynamics has been used heuristically to explain the success of SGD, as an optimization algorithm to [escape local minima](https://arxiv.org/abs/1702.05575), and has inspired [entropy-SGD for optimizing neural networks](https://arxiv.org/abs/1611.01838). The idea of using randomness has also been used to [escape from saddle points](http://www.offconvex.org/2017/07/19/saddle-efficiency/).
One generic algorithm for online optimization is the multiplicative weights algorithm, which reduces to a sampling problem in the continuous case ([Narayanan et al. 2010](http://papers.nips.cc/paper/3972-random-walk-approach-to-regret-minimization)). Moreover, there are settings such as online logistic regression in which the only known way to achieve optimal regret is through a [Bayesian sampling approach](https://arxiv.org/abs/1803.09349).
<!--and the multiplicative weights algorithm for online optimization in the continuous case [reduces to a sampling problem](...). LINK-->

**Break here if splitting into two posts.
In the next post I describe our algorithm and give a sketch of the main proof. / Continuing the previous post, I now describe our algorithm to sample from multimodal distributions $p(x)\propto e^{-f(x)}$, given query access to $f$ and $\nabla f$.**

# Algorithm

The two components of our algorithm, Langevin diffusion and simulated tempering.

## Langevin diffusion

Langevin diffusion is a continuous time random-walk for sampling from $p\propto e^{-f}$, given access to the gradient of the log-pdf, $f$. It is gradient flow plus Brownian motion, and described by a stochastic differential equation
$$dx_t = -\be_t \nb f(x_t)dt + \sqrt 2 d W_t.$$
The $\eta$-discretized version is where we take a gradient step, with step size $\eta$, and add gaussian noise scaled by $\sqrt{2\eta}$:[^f3]
$$x_{t+\eta}=x_t-\eta \nb f(x_t) + \sqrt{2\eta}\xi_t.$$

[^f3]: The reason for the square-root scaling is that noise from Brownian motion scales as the square root of the time elapsed (the standard deviation of a sum of $n$ iid random variables scales as $\sqrt{n}$). 

Langevin diffusion has been well-studied, both in the math and CS communities.
It is a classical result that the stationary distribution is proportional to $e^{-f(x)}$. Bakry and Emery showed in the 80's that if $p$ is $\alpha$-log-concave, then the mixing time is on the order of $\frac 1{\alpha}$ (see Terence Tao's [blog post](https://terrytao.wordpress.com/2013/02/05/some-notes-on-bakry-emery-theory/)).

With the recent algorithmic interest in Langevin diffusion, we want similar guarantees for discretized chain - that it converges to a measure close to $p$. This was done in a series of works including [Dalalyan et al. 2017](https://arxiv.org/abs/1710.00095), [Durmus et al. 2018](https://arxiv.org/abs/1802.09188), and [Bubeck et al. 2015](https://arxiv.org/abs/1507.02564) who also considered restriction to a convex set. For general distributions $p$ with some regularity conditions, [Raginsky et al. 2017](https://arxiv.org/abs/1702.03849) showede convergence to $p$ in time comparable to continuous dynamics.

*So why can't we just run Langevin diffusion?*

Consider the example of well-separated gaussians. [Bovier  et al. 2004](http://www.ems-ph.org/journals/show_abstract.php?issn=1435-9855%20&vol=6&iss=4&rank=1) showed, via the theory of metastable processes, that transitioning from one peak to another takes exponential time. Roughly speaking, to estimate the expected time to travel from one mode to the other, consider paths between those modes. The time will be inversely proportional to the maximum, over all paths between the modes, of the minimum probability on the path.

If two gaussians with unit variance have means separated by $2r$, then any path between them will pass through a point with probability less than $e^{-r^2/2}$, so it will take on the order of $e^{r^2/2}$ time to move between the gaussians. Think of this as a "energy barrier" Langevin diffusion has to cross. Even if $r$ is as small as $\log d$, the time will be superpolynomial in $d$.

<center>
<img src="pics/separated2.png">
</center>

## Simulated tempering turns the heat on

A key observation is that Langevin corresponding to a higher temperature distribution (with $\beta f$ rather than $f$, with inverse temperature $\beta<1$) mixes faster. A high temperature flattens out the distribution.[^f4]

[^f4]: Changing the temperature is just changing the scaling of the gradient step with respect to the noise.

However, we can't simply run Langevin at a higher temperature because the stationary distribution is wrong. 
The idea behind simulated tempering is to combine Markov chains at different temperatures, sometimes swapping to another temperature to help lower-temperature chains explore.

We can define simulated tempering with respect to any sequence of Markov chains $M_i$ on the same space. Think of $M_i$ as the Markov chain corresponding to temperature $i$, with stationary distribution $\propto e^{-\beta f_i}$.

Then we define the simulated tempering Markov chain as follows.

* The *state space* is $L$ copies of the state space (in our case $\mathbb R^d$), one copy for each temperature.
* The evolution is defined as follows.
	* If the current point is $(i,x)$, then evolve according to the $i$th chain $M_i$.
    * Propose swaps with some rate $\lambda$.[^f5] When a swap is proposed, attempt to move to a neighboring chain, $i'=i\pm 1$. With probability $\min\{p_{i'}(x)/p_i(x), 1\}$, the transition is successful. Otherwise, stay at the same point. This is a **Metropolis-Hastings step**; its purpose is to preserve the stationary distribution.

[^f5]: This definition is stated for continuous Markov chains. By rate $\lambda$ I mean that the time between swaps is an exponential distribution with decay $\lambda$ (in other words, the times of the swaps forms a Poisson process). A version for discrete Markov chains is to swap with probability $\lambda$ and to follow the current chain with probability $1-\lambda$. Note that simulated tempering is traditionally defined for discrete Markov chains, but we will need the continuous version for our proof.

It's not too hard to see that the stationary distribution is the mixture distribution, i.e., $p(i,x) = \rc L p_i(x)$. Simulated tempering is popular in practice along with other temperature-based methods such as simulated annealing, parallel tempering, (reverse) annealed importance sampling, and particle filters. [Zheng 2003](https://www.sciencedirect.com/science/article/pii/S0304414902002326) and [Woodard et al. 2009](https://projecteuclid.org/euclid.aoap/1241702244) gave decomposition results that can be used to bound mixing time; however in our setting their bound on mixing time is exponential in the number of gaussians.[^f6]

[^f6]: They proceed by first bounding the spectral gap for parallel tempering, and then showing the gap for simulated tempering is lower-bounded in terms of that. However, in our experience, directly bounding the spectral gap for simulated tempering is easier.

## Combining Langevin diffusion and simulated tempering

Our algorithm is the following. Assume $\sigma=1$ for simplicity.

Take a sequence of $\beta$'s starting from $1/D^2$, going up by factors of $1+1/d$ (where $d$ is the ambient dimension) up to 1 and run simulated tempering for Langevin on these temperatures, suitably discretized.
Finally, take the samples that are at the $L$th temperature.

<center>
<img src="pics/stl.png" width="50%" height="50%">
</center>

# Proof sketch

There are four main steps in the proof.

1. Prove a Markov chain decomposition theorem for distributions, that upper-bounds the mixing time. For discrete/continuous-time Markov chains, this is equivalent to showing a spectral gap/Poincaré inequality.
2. Show that the conditions of the theorem are satisfied: mixing on component chains, and mixing on a certain projected chain. This shows that the simulated tempering chain mixes, if we move the $\beta_i$'s "inside" the mixture of gaussians. This makes the stationary distribution $\wt p_i$ at each temperature a mixture of gaussians, so is easier to analyze.
4. Show that $\wt p_i$ are close to the acutal distributions $p_i$, so that we also have rapid mixing for the original chain.
5. Some technical details remain that we won't cover: bounding the error from discretizing the chain, and estimating the partition functions to within a constant factor.

# Markov chain decomposition theorem

## Previous decomposition theorems

[Madras and Randall's theorem](https://www.jstor.org/stable/2699896) says that if a Markov chain M mixes rapidly when restricted to each set of the partition, and the "projected" Markov chain mixes rapidly, then M mixes rapidly. The formal statement is the following.

> **Theorem (Madras, Randall 02):** For a (discrete-time) Markov chain $M$ with stationary distribution $p$ and a partition $\Om = \bigsqcup_{j=1}^m A_j$ of its state space, $$\text{Gap}(M) \ge \rc 2 \text{Gap}(\ol M) \min_{1\le j\le m} (\text{Gap}(M|_{A_j})).$$

The projected chain $\overline M$ is defined on $\{1,\ldots, m\}$, and transition probabilities are given by average probability flows between the corresponding sets. More precisely, the probability of transitioning from $j$ to $k$ is as follows: pick a random point in $A_j$, run the Markov chain for one step, and see what's the probability of landing in $A_k$.

This gives a potential plan for the proof. Given a mixture of $m$ gaussians, suppose we can partition $\mathbb R^d$ into $m$ parts - maybe one centered around each gaussian - such that Langevin mixes rapidly inside each set. Choose the highest temperature so that Langvein mixes well on the entire space $\R^d$ at that temperature. 

<center>
<!--img src="pics/sigma_0.5.png"-->
<img src="pics/partition.jpeg" width="50%" height="50%">
</center>

Then if the projected chain also mixes rapidly, this proves the main theorem. Intuitively, the projected chain mixes rapidly because the highest temperature acts like a bridge. There is a reasonable path from any component to any other component passing through the highest temperature.

There are many issues with this approach. The primary problem is defining the partition. Our first proof followed this plan; later we found a simpler proof with better bounds, which I'll now describe.

## Decomposition theorem with sets

The insight is to work with distributions rather than sets.

There's an idea in math that a theorem is true for sets, then it's a special case of a theorem for functions - because sets just correspond to indicator functions.

For simulated tempering Langevin on a mixture of Gaussians, we don't naturally have a decomposition of the state space, we do have a natural decomposition of the stationary distribution - namely the components of the mixture! Think of this as a "soft partition".

So instead of partitioning $\Omega$, we decompose the Markov chain and stationary distribution. We prove a new Markov chain decomposition theorem that allows us to do this.

> **Theorem:** Let $M_{\text{st}}$ be a simulated tempering Markov chain (with stationary distribution $p$) made up of Markov chains $M_i,i\in [L]$. Suppose there is a decomposition $$M_i(x,y)=\sum_{j=1}^mw_{ij}M_{ij}(x,y)$$ where $M_{ij}$ has stationary distribution $p_{ij}$.
> If each $M_{ij}$ mixes in time $C$ and the projected chain mixes in time $\ol C$, then the simulated tempering chain mixes in time $O(C(\ol C +1))$.
> 
> The projected chain is defined by \begin{align} L((i,j),(i,j')) &=
	\begin{cases}
	\fc{w_{i,j'}}{\chi^2_{\text{sym}}(p_{i,j}||p_{i,j'})},&i=i'\\
	\fc{1}{\chi^2_{\text{sym}}(p_{i,j}||p_{i',j'}))}
	,&i'=i\pm 1\\
	0,&\text{else.}
	\end{cases}
	\end{align}
> where $\chi^2_{\text{sym}}(p||q)=\max\{\chi^2(p||q),\chi^2(q||p)\}$ is the "symmetrized" $\chi^2$ divergence.

This theorem is where most of the magic lies, but it is also somewhat technical; see the paper for details.

## Applying the decomposition theorem

We consider simulated tempering Langevin diffusion for
$$
\wt p_i \propto \sumo jm w_j \ub{\exp\pa{-\fc{\be_i \ve{x-\mu_j}^2}2}}{\wt p_{ij}}.
$$ 

The Langevin chain decomposes into Langevin on the mixture components. By the decomposition theorem, if the Markov chain with respect to these components mixes rapidly, and the Markov chain on the "projected" chain mixes rapidly, then the simulated tempering chain mixes rapidly. We verify each of the two conditions.

1. Langevin mixes rapidly for each $\wt p_{ij}$, in time $O(D^2)$, by Bakry-Emery, because the highest temperature is $D^2$.
2. The projected chain mixes rapidly, in time $O(L^2)$. To see this, note that by choosing the temperatures close enough, the $\chi^2$ distance between the gaussians in adjacent temperatures is at most a constant, and by choosing the highest temperature high enough, all the gaussians there are also close. Thus, the projected chain looks like $L$ stacks of $m$ nodes, where the nodes in the same stack at adjacent temperatures have probability flow $\Omega(1)$ between them, and the subgraph consisting of nodes at the highest temperature mixes almost immediately.

<center>
<img src="pics/proj_chain.png" width="50%" height="50%">
</center>

Thus the simulated tempering chain for $\wt p_i$ mixes in time $O(L^2D^2)$.

## Simulated tempering mixes for $p$

But we need mixing for simulated tempering where the temperature is outside the sum,
$$
p_i \propto \pa{\sumo jm w_j \exp\pa{-\fc{\ve{x-\mu_j}^2}2}}^{\be_i}.
$$
This follows from mixing for $\wt p_i$, plus the fact that the ratio $p_i/\wt p_i$ is bounded: $\fc{p_i}{\wt p_i}\in [w_{\min}, \rc{w_{\min}}]$. We lose a factor of $\rc{w_{\min}^2}$. This finishes the proof of the main result.

# Takeaways

* "Beyond log-concavity" for sampling is the analogue of "beyond convexity" for optimization
* There is a spectral decomposition lemma for Markov chains based on decomposing the *Markov chain* rather than just the *state space*, and that helps prove mixing for simulated tempering.
* Provable sampling holds for a prototypical multimodal distribution: mixture of Gaussians.

# Further directions

Here are further directions and open questions we would like to explore. Feel free to get in touch if you have ideas!

1. How do we deal with gaussians with different variances? Equal (or approximately equal) variances appear to be necessary in the query model because of the "needle in a haystack" problem: the "attractor region" for a skinny gaussian could be exponentially small. However, other information may help.
1. Carry out average-case analysis for distributions of interest, such as posteriors of mixture models, Ising models, stochastic/censored block models, and RBM's. These distributions are more complicated than a mixture of gaussians; for example, the posterior for gaussian mixture model is a sum of exponentially many gaussians. 
		
	One obstacle is that in many distributions $p$ of interest, $p\propto e^{-f}$ is not mixture of the probability distribution, but rather, $f$ is a combination of simpler functions. In other words, $p\propto e^{-\sum_j w_jf_j}$ rather than $p\propto \sum_j w_j e^{-f_j}$. When this combination happens in the exponent, the decomposition approach doesn't work so well.[^fao] 
		
	It would be great to find other uses for our simulated tempering decomposition theorem - in principle the theorem could even apply when there are exponentially many modes, as long as we create a refining partition such that there is no "bottleneck" at any point.[^ftree]
1. What are the guarantees for other temperature heuristics used in practice, such as particle filters, annealed importance sampling, and parallel tempering? One undesirable  property of simulated tempering is that it incurs a factor of $O(L^2)$ in the running time, where $L$ is the number of levels. Particle filters and annealed importance sampling move only from higher to lower temperature, and so only incur a factor of $O(L)$.

[^fao]: Think of the downstairs combination as an OR combination, the upstairs one as a AND.
[^ftree]: We stated it in the case where we had the same partition at every level. The more general form of the theorem works even if the partitions on different. The bound could be polynomial even if there are exponentially many components.
