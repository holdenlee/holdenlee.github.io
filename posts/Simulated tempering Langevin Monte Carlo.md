---
title: Simulated tempering Langevin Monte Carlo
subtitle: Rong Ge, Holden Lee, Andrej Risteski
published: 2017-11-26
modified: 2017-11-26
parent: Research
tags: math
type: uncategorized
showTOC: True
---

This page is about the following paper:

> Ge, R., Lee, H., & Risteski, A. (2017). **Beyond Log-concavity: Provable Guarantees for Sampling Multi-modal Distributions using Simulated Tempering Langevin Monte Carlo.** arXiv preprint arXiv:1710.02736.

Shortlink: To be filled in.

* [arXiv](https://arxiv.org/abs/1710.02736), [pdf](https://arxiv.org/pdf/1710.02736.pdf).
* Slides: To be added.
* Poster: To be added.

# Cartoon

<center>
<img src="pics/not_mixing.png">
</center>

A Markov chain with local moves such as Langevin diffusion gets stuck in a local mode.

<center>
<img src="pics/mixing.png">
</center>

Creating a meta-Markov chain which *changes the temperature* can exponentially speed up mixing.

# Abstract

A key task in Bayesian statistics is sampling from distributions that are only specified up to a partition function (i.e., constant of proportionality). However, without any assumptions, sampling (even approximately) can be #P-hard, and few works have provided "beyond worst-case" guarantees for such settings.
 
For log-concave distributions, classical results going back to Bakry and Emery (1985) show that natural continuous-time Markov chains called Langevin diffusions mix in polynomial time. The most salient feature of log-concavity violated in practice is uni-modality: commonly, the distributions we wish to sample from are multi-modal. In the presence of multiple deep and well-separated modes, Langevin diffusion suffers from torpid mixing.

We address this problem by combining Langevin diffusion with simulated tempering. The result is a Markov chain that mixes more rapidly by transitioning between different temperatures of the distribution. We analyze this Markov chain for the canonical multi-modal distribution: a mixture of gaussians (of equal variance). The algorithm based on our Markov chain provably samples from distributions that are close to mixtures of gaussians, given access to the gradient of the log-pdf.

# Introduction

Summary:

* I compare sampling to *optimization*. "Beyond log-concavity" is the analogue of "beyond convexity" in the Bayesian world. Moreover, there are close connections between optimization and sampling, so there's reason to study sampling even if you only care about optimization.
* Sampling is a fundamental task in Bayesian statistics.
* To help with sampling, temperature-based methods are widely used, but lack theoretical analysis.

## Optimization vs. sampling

The goal in optimization is to find the minimum of a function $f$. 

When $f$ is convex, this is well-understood and can be solved using local search algorithms such as gradient descent.

When $f$ is non-convex, the problem is NP-hard in the worst-case, but algorithms often work well in practice.

Here is a comparison of convex and non-convex optimization, the "great divide" of optimization.

| Convex optimization | Non-convex optimization |
| --- | --- |
| Local minimum = global minima | Possibly bad local minima |
| Gradient descent finds global minimum | Gradient descent can be bad |
| Provable algorithms with beautiful mathematics | NP-hard in the worst-case (messy), but often works in practice |
| | Modern optimization problems (e.g. machine learning) are often non-convex.|



# FAQ

Q: Why not simulated annealing?

Q: What about gaussians of unequal variance?

Q: If the sample at time $t$ isn't from the $L$th level, can't you just take the first sample after that that is in the $L$th level?


Thoughts, questions, typos? Leave a comment below.