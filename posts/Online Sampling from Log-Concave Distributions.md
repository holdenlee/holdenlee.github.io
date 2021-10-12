---
title: Online Sampling from Log-Concave Distributions
subtitle: Holden Lee, Oren Mangoubi, Nisheeth K. Vishnoi
published: 2019-10-26
modified: 2019-12-2
parent: Research
tags: math
type: uncategorized
showTOC: True
---

# Basic information

This page is about the following paper:

> H. Lee, O. Mangoubi, & N. Vishnoi. (2019). **Online Sampling from Log-Concave Distributions.** NeurIPS 2019. arXiv:1812.00793.

Shortlink: [tiny.cc/lmv19](http://tiny.cc/lmv19)

* [arXiv](https://arxiv.org/abs/1902.08179), [pdf](https://arxiv.org/pdf/1902.08179).
* Slides: [pptx](https://www.dropbox.com/s/eh8xhyezjgld3zm/Online_Sampling_slides.pptx?dl=0), [pdf](https://www.dropbox.com/s/okiu86xelr97jvb/Online_Sampling_slides.pdf?dl=0) (Shortlink: tiny.cc/lmv19slides)
* [Poster (pdf)](https://www.dropbox.com/s/wggphmt8zl3e0je/poster.pdf?dl=0) (Shortlink: tiny.cc/lmv19poster)
* [Video](http://tiny.cc/lmv19video) (Shortlink: tiny.cc/lmv19video)
* [Code](https://github.com/holdenlee/Online_Sampling)

## Abstract

Given a sequence of convex functions $f_0, f_1, \ldots, f_T$, we study the problem of sampling from the Gibbs distribution $\pi_t \propto e^{-\sum_{k=0}^t f_k}$ for each epoch $t$ in an *online* manner. Interest in this problem derives from applications in machine learning, Bayesian statistics, and optimization where, rather than obtaining all the observations at once, one constantly acquires new data, and must continuously update the distribution. Our main result is an algorithm that generates roughly independent samples from $\pi_t$ for every epoch $t$ and, under mild assumptions, makes  $\mathrm{polylog}(T)$ gradient evaluations per epoch. All previous results imply a bound on the number of gradient or function evaluations which is at least linear in $T$. Motivated by real-world applications, we assume that functions are smooth, their associated distributions have a bounded second moment, and their minimizer drifts in a bounded manner, but do not assume they are strongly convex.  In particular, our assumptions hold for online Bayesian logistic regression, when the data satisfy natural regularity properties, giving a sampling algorithm with updates that are poly-logarithmic in $T$.  In simulations, our algorithm achieves accuracy comparable to an algorithm specialized to logistic regression.  Key to our algorithm is a novel stochastic gradient Langevin dynamics Markov chain with a carefully designed variance reduction step and constant batch size. Technically, lack of strong convexity is a significant barrier to analysis and, here, our main contribution is a martingale exit time argument that shows our Markov chain remains in a ball of radius roughly poly-logarithmic in $T$ for enough time to reach within $\epsilon$ of $\pi_t$.
