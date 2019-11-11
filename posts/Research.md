---
title: Research
published: 2017-08-07
modified: 2019-05-26
parent: Math
tags: math
type: uncategorized
showTOC: True
---

I received my Ph.D. from Princeton, where I was advised by [Sanjeev Arora](https://www.cs.princeton.edu/~arora/) ([research group page](http://unsupervised.cs.princeton.edu/), [ML theory at Princeton](http://mltheory.cs.princeton.edu/)).

I focus on machine learning theory and applied probability, and also have broad interests in theoretical computer science and related math.

# Research interests

Although machine learning (and deep learning in particular) has made great advances in recent years, our mathematical understanding of it is shallow. Learning problems can be highly nonconvex, yet tractable in practice. What hidden structure do these problems have, and how can we design algorithms to take advantage of it?

Current interests include: 

+ **Probabilistic modeling (Bayesian inference)**: How to design provable algorithms for learning probability distributions and sampling from them? How can we improve classical algorithms like Markov Chain Monte Carlo, or test the quality of the samples?
+ **Control theory and reinforcement learning**: It is a well-studied problem how to find the optimal control for known linear dynamical system. However, reinforcement learning deals with learning how to act  unknown, combinatorially complex systems; algorithms are heuristic and slow. How to bridge this gap?
+ **Neural networks**: Neural networks tackle highly nonconvex problems but do very well in practice. Why? What kind of algorithmic improvements can we come up with by understanding their theoretical foundations more deeply?
+ **Natural language understanding**: Language is a fundamental part of human intelligence and a big frontier for machine learning. How do we create machines that can understand "grammar" and "semantics"?

# Papers

The publication list is available as [pdf](https://www.dropbox.com/s/7fas5lckj99sqx0/publication_list.pdf?dl=0).

## Machine learning

### Bayesian inference

*   **Estimating Normalizing Constants for Log-Concave Distributions: Algorithms and Lower Bounds**
	
	with Rong Ge and Jianfeng Lu.
	
	*In submission.* [[arXiv](https://arxiv.org/abs/1911.03043), [pdf](https://arxiv.org/pdf/1911.03043)]
	
*   **Online Sampling from Log-Concave Distributions**
	
	with Oren Mangoubi and Nisheeth Vishnoi. 
	
	NeurIPS 2019. [[arXiv](https://arxiv.org/abs/1902.08179), [pdf](https://arxiv.org/pdf/1902.08179)] [webpage](Online Sampling from Log-Concave Distributions.html)
	
*   **Beyond Log-concavity: Provable Guarantees for Sampling Multi-modal Distributions using Simulated Tempering Langevin Monte Carlo.** [webpage](Simulated tempering Langevin Monte Carlo.html)
	
	with Rong Ge and Andrej Risteski.
	
	* NeurIPS 2018. [[arXiv](https://arxiv.org/abs/1812.00793), [pdf](https://arxiv.org/pdf/1812.00793.pdf)]
	* NIPS AABI Workshop 2017. [[arXiv](https://arxiv.org/abs/1710.02736), [pdf](https://arxiv.org/pdf/1710.02736.pdf)]

### Reinforcement learning and control theory

*   **Statistical Guarantees for Learning an Autoregressive Filter**

	with Cyril Zhang. Preprint. [[arxiv](https://arxiv.org/abs/1905.09897), [pdf](https://arxiv.org/pdf/1905.09897.pdf)]
	
*   **Spectral Filtering for General Linear Dynamical Systems**
	
	with Elad Hazan, Karan Singh, Cyril Zhang, and Yi Zhang. [[arxiv](https://arxiv.org/abs/1802.03981), [pdf](https://arxiv.org/pdf/1802.03981.pdf)]
	
	NeurIPS 2018 (oral).

*   **Towards Provable Control for Unknown Linear Dynamical Systems.**
	
	with Sanjeev Arora, Elad Hazan, Karan Singh, Cyril Zhang, and Yi Zhang. [[ICLR page](https://openreview.net/forum?id=HJGuXK1vM), [pdf](https://openreview.net/pdf?id=HJGuXK1vM)]
	
	ICLR workshop 2018.
	
### Neural networks
	
*   **Explaining Landscape Connectivity of Low-cost Solutions for Multilayer Nets.**
	
	with Rohith Kuditipudi, Xiang Wang, Yi Zhang, Zhiyuan Li, Wei Hu, Rong Ge, and Sanjeev Arora.
	
	NeurIPS 2019. [[arXiv](https://arxiv.org/abs/1906.06247), [pdf](https://arxiv.org/pdf/1906.06247)]
	
*   **On the Ability of Neural Nets to Express Distributions.** 
	
	with Rong Ge, Tengyu Ma, Andrej Risteski, and Sanjeev Arora. [[arXiv](https://arxiv.org/abs/1702.07028), [pdf](https://arxiv.org/pdf/1702.07028.pdf), [PMLR 65:1271-1296](http://proceedings.mlr.press/v65/lee17a/lee17a.pdf), [webpage](http://tiny.cc/hlcolt17)]
	
	COLT 2017. 

## Complexity theory

*   **Quadratic polynomials of small modulus cannot represent OR.** 
	
	Unpublished, 2015. [[arXiv](http://arxiv.org/abs/1509.08896), [pdf](http://arxiv.org/pdf/1509.08896.pdf)]

## Number theory

*   **l-adic properties of partition functions.**
	
	with Eva Belmont, Alexandra Musat, and Sarah Trebat-Leder.

	[Monatshefte für Mathematik, 173(1), 1-34](http://link.springer.com/article/10.1007/s00605-013-0586-y), 2014. [[arXiv](https://arxiv.org/abs/1510.01202), [pdf](https://arxiv.org/pdf/1510.01202.pdf), [presentation](https://www.dropbox.com/s/81413cszqabcwcx/MIT%20presentation.pdf?dl=0), [webpage](l-adic properties of partition functions.html)]
