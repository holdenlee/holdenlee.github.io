---
title: Research
published: 2017-08-07
modified: 2022-11-27
parent: Math
tags: math
type: uncategorized
showTOC: True
---

I received my Ph.D. from Princeton, where I was advised by [Sanjeev Arora](https://www.cs.princeton.edu/~arora/).

I focus on machine learning theory and applied probability, and also have broad interests in theoretical computer science and related math.

# Research interests

<!-- Although machine learning (and deep learning in particular) has made great advances in recent years, our mathematical understanding of it is shallow. Learning problems can be highly nonconvex, yet tractable in practice. What hidden structure do these problems have, and how can we design algorithms to take advantage of it? -->

Current interests include: 

+ **Probabilistic methods in machine learning**, with a focus on **sampling (MCMC) algorithms**: How to design provable algorithms for learning probability distributions and sampling from them? 
<!--How can we improve classical algorithms like Markov Chain Monte Carlo, or test the quality of the samples?-->
+ **Control theory and reinforcement learning**, with a focus on **learning dynamical systems**: It is a well-studied problem how to find the optimal control for a known linear dynamical system. However, reinforcement learning deals with learning how to act in unknown, combinatorially complex systems; algorithms are heuristic and slow. How to bridge this gap?
+ **Neural networks**: Neural networks tackle highly nonconvex problems but do very well in practice. Why? What kind of algorithmic improvements can we come up with by understanding their theoretical foundations more deeply?
+ **Natural language understanding**: Language is a fundamental part of human intelligence and a big frontier for machine learning. How do we create machines that can understand "grammar" and "semantics"?

# Papers

The publication list is available as [pdf](https://www.dropbox.com/s/7fas5lckj99sqx0/publication_list.pdf?dl=0).

[A] denotes alphabetical order of authors.

<!-- Pitfalls of Gaussians as a noise distribution in NCE
Holden Lee, Chirag Pabbaraju, Anish Sevekari, Andrej Risteski
[arxiv](https://arxiv.org/abs/2210.00189)
-->

## Generative modeling, learning probability distributions

*   **Provable benefits of score matching**
	
	Chirag Pabbaraju, Dhruv Rohatgi, Anish Prasad Sevekari, Holden Lee, Ankur Moitra, Andrej Risteski.
	
	[NeurIPS 2023](https://proceedings.neurips.cc/paper_files/paper/2023/hash/c11f8d40c119867e30e3421f696f931d-Abstract-Conference.html) (Spotlight). [[arxiv](https://arxiv.org/abs/2306.01993)]

*   **The probability flow ODE is provably fast**
	
	[A] Sitan Chen, Sinho Chewi, **Holden Lee**, Yuanzhi Li, Jianfeng Lu, Adil Salim
	
	NeurIPS 2023. [[arxiv](https://arxiv.org/abs/2306.01993))

*   **Improved Analysis of Score-based Generative Modeling: User-Friendly Bounds under Minimal Smoothness Assumptions**

	[A] Hongrui Chen, **Holden Lee**, and Jianfeng Lu.
	
	ICML 2023. [[arxiv](https://arxiv.org/abs/2211.01916)]	

*   **Pitfalls of Gaussians as a noise distribution in NCE**

	**Holden Lee**, Chirag Pabbaraju, Anish Sevekari, and Andrej Risteski.
	
    ICLR 2023, NeurIPS 2022 Workshop on Self-Supervised Learning. [[arxiv](https://arxiv.org/abs/2210.00189)]

*   **Convergence of score-based generative modeling for general data distributions**
	
	[A] **Holden Lee**, Jianfeng Lu, and Yixin Tan.
	
    NeurIPS 2022 Workshop on Score-Based Methods. [[arxiv](https://arxiv.org/abs/2209.12381)]

*   **Convergence for score-based generative modeling with polynomial complexity**
	
	[A] **Holden Lee**, Jianfeng Lu, and Yixin Tan.
	
	[NeurIPS 2022](https://neurips.cc/virtual/2022/poster/53863) (oral). [[arxiv](https://arxiv.org/abs/2206.06227), [slides](https://www.dropbox.com/s/una0wbbr4jknz0l/score-talk.pdf?dl=0)]

*   **Universal Approximation for Log-concave Distributions using Well-conditioned Normalizing Flows.**
	
	**Holden Lee**, Chirag Pabbaraju, Anish Sevekari, Andrej Risteski. 
	
	NeurIPS 2021. [[arXiv](https://arxiv.org/abs/2107.02951), [pdf](https://arxiv.org/pdf/2107.02951), [slides](https://www.dropbox.com/s/r0jp53sqqaol4bj/NF%20-%20CMU.pptx?dl=0)]


## Algorithms for sampling and counting

*   **Sampling List Packings**
	
	[A] Evan Camrud, Ewan Davies, Alex Karduna, Holden Lee.
	
	[arxiv](https://arxiv.org/abs/2402.03520)

*   **Parallelising Glauber Dynamics**
	
	Holden Lee.
	
	[arxiv](https://arxiv.org/abs/2307.07131)

*   **Fisher information lower bounds for sampling**

	[A] Sinho Chewi, Patrik Gerber, **Holden Lee**, Chen Lu.
	
	In submission. [[arxiv](https://arxiv.org/abs/2210.02482)]

*   **Sampling Approximately Low-Rank Ising Models: MCMC meets Variational Methods**
	
	[A] Frederic Koehler, **Holden Lee**, and Andrej Risteski.
	
	COLT 2022. [[arXiv](https://arxiv.org/abs/2202.08907), [pdf](https://arxiv.org/pdf/2202.08907), [slides](https://www.dropbox.com/s/grd6fo5aa640kra/lri-talk.pdf?dl=0), [video](https://slideslive.com/38985703/sampling-approximately-lowrank-ising-models-mcmc-meets-variational-methods?ref=folder-104261)]

*   **Approximation algorithms for the random-field Ising model**
	
	[A] Tyler Helmuth, **Holden Lee**, Will Perkins, Mohan Ravichandran, and Qiang Wu.
	
	SIAM Journal on Discrete Mathematics 37 (3), 1610-1629. [[arXiv](https://arxiv.org/abs/2108.11889), [pdf](https://arxiv.org/pdf/2108.11889)]

*   **Efficient sampling from the Bingham distribution**
	
	[A] Rong Ge, **Holden Lee**, Jianfeng Lu, and Andrej Risteski.
	
	ALT 2021. [[arXiv](https://arxiv.org/abs/2010.00137), [pdf](https://arxiv.org/pdf/2010.00137), [video](https://www.youtube.com/watch?v=6dkS-Hdg8cs)]

*   **Estimating Normalizing Constants for Log-Concave Distributions: Algorithms and Lower Bounds**
	
	[A] Rong Ge, **Holden Lee**, and Jianfeng Lu.
	
	STOC 2020. [[arXiv](https://arxiv.org/abs/1911.03043), [pdf](https://arxiv.org/pdf/1911.03043), [STOC 2020:579–586](https://dl.acm.org/citation.cfm?id=3384289), [slides](https://www.dropbox.com/s/da2mz50a76k9suz/NormalizingConstant_Presentation.pdf?dl=0), [video](https://www.youtube.com/watch?v=TqdtxcYaw3I&list=PLn0nrSd4xjjadfcMd5xvmJ_GNSLDi1ATn)]
	
*   **Online Sampling from Log-Concave Distributions**
	
	[A] **Holden Lee**, Oren Mangoubi, and Nisheeth Vishnoi. 
	
	NeurIPS 2019. [[arXiv](https://arxiv.org/abs/1902.08179), [pdf](https://arxiv.org/pdf/1902.08179), [webpage](Online%20Sampling%20from%20Log-Concave Distributions.html)]
	
*   **Beyond Log-concavity: Provable Guarantees for Sampling Multi-modal Distributions using Simulated Tempering Langevin Monte Carlo.** [webpage](Simulated tempering Langevin Monte Carlo.html)
	
	[A] Rong Ge, **Holden Lee**, and Andrej Risteski.
	
	* NeurIPS 2018. [[arXiv](https://arxiv.org/abs/1812.00793), [pdf](https://arxiv.org/pdf/1812.00793.pdf)]
	* NIPS AABI Workshop 2017. [[arXiv](https://arxiv.org/abs/1710.02736), [pdf](https://arxiv.org/pdf/1710.02736.pdf)]
	* Blog post on offconvex: [1](http://www.offconvex.org/2020/09/19/beyondlogconvavesampling/), [2](http://www.offconvex.org/2021/03/01/beyondlogconcave2/).
	

## Reinforcement learning and control theory

*   **Extracting Latent State Representations with Linear Dynamics from Rich Observations**

	Abraham Frandsen, Rong Ge, and **Holden Lee**.
	
	[ICML 2022](https://proceedings.mlr.press/v162/frandsen22a.html).

*   **Improved rates for identification of partially observed linear dynamical systems**
	
	**Holden Lee**.
	
	ALT 2022. [[arXiv](https://arxiv.org/abs/2011.10006), [pdf](https://arxiv.org/pdf/2011.10006)]
	
*   **No-Regret Prediction in Marginally Stable Systems**

	[A] Udaya Ghai, **Holden Lee**, Karan Singh, Cyril Zhang, and Yi Zhang.
	
	COLT 2020. [[arxiv](https://arxiv.org/abs/2002.02064), [pdf](https://arxiv.org/pdf/2002.02064.pdf), [slides](https://www.dropbox.com/s/74idgddlkbosiil/slides-colt.pdf?dl=0), [summary slide](https://www.dropbox.com/s/rbmr4rk3vixahoc/slides-colt-short.pdf?dl=0), [videos](https://www.colt2020.org/virtual/papers/paper_34.html)]

*   **Statistical Guarantees for Learning an Autoregressive Filter**

	[A] **Holden Lee** and Cyril Zhang.
	
	ALT 2020. [[arxiv](https://arxiv.org/abs/1905.09897), [pdf](https://arxiv.org/pdf/1905.09897.pdf)]
	
*   **Spectral Filtering for General Linear Dynamical Systems**
	
	[A] Elad Hazan, **Holden Lee**, Karan Singh, Cyril Zhang, and Yi Zhang.
	
	NeurIPS 2018 (oral). [[arxiv](https://arxiv.org/abs/1802.03981), [pdf](https://arxiv.org/pdf/1802.03981.pdf)]

*   **Towards Provable Control for Unknown Linear Dynamical Systems.**
	
	[A] Sanjeev Arora, Elad Hazan, **Holden Lee**, Karan Singh, Cyril Zhang, and Yi Zhang.
	
	ICLR workshop 2018. [[ICLR page](https://openreview.net/forum?id=HJGuXK1vM), [pdf](https://openreview.net/pdf?id=HJGuXK1vM)]

## Natural language processing

*   **Principled Gradient-based Markov Chain Monte Carlo for Text Generation**
	
	Li Du, Afra Amini, Lucas Torroba Hennigen, Xinyan Velocity Yu, Jason Eisner, Holden Lee, Ryan Cotterell.
	
	[arxiv](https://arxiv.org/abs/2312.17710)


*   **Connecting Pre-trained Language Model and Downstream Task via Properties of Representation**
	
	Chenwei Wu, Holden Lee, Rong Ge.
	
	[NeurIPS 2023](https://proceedings.neurips.cc/paper_files/paper/2023/hash/93712c59f6a81bd92040facf04c8b308-Abstract-Conference.html).

## Neural networks
	
*   **Explaining Landscape Connectivity of Low-cost Solutions for Multilayer Nets.**
	
	Rohith Kuditipudi, Xiang Wang, **Holden Lee**, Yi Zhang, Zhiyuan Li, Wei Hu, Rong Ge, and Sanjeev Arora.
	
	NeurIPS 2019. [[arXiv](https://arxiv.org/abs/1906.06247), [pdf](https://arxiv.org/pdf/1906.06247)]
	
*   **On the Ability of Neural Nets to Express Distributions.** 
	
	**Holden Lee**, Rong Ge, Tengyu Ma, Andrej Risteski, and Sanjeev Arora.
	
	COLT 2017. [[arXiv](https://arxiv.org/abs/1702.07028), [pdf](https://arxiv.org/pdf/1702.07028.pdf), [PMLR 65:1271-1296](http://proceedings.mlr.press/v65/lee17a/lee17a.pdf), [webpage](http://tiny.cc/hlcolt17)]

## Machine Learning (other)

*   **How Flawed is ECE? An Analysis via Logit Smoothing**
	
	[A] Muthu Chidambaram, Holden Lee, Colin McSwiggen, Semon Rezchikov.
	
	[arxiv](https://arxiv.org/abs/2402.10046)

## Complexity theory

*   **Quadratic polynomials of small modulus cannot represent OR.** 

	**Holden Lee**
	
	Unpublished, 2015. [[arXiv](http://arxiv.org/abs/1509.08896), [pdf](http://arxiv.org/pdf/1509.08896.pdf)]

## Number theory

*   **l-adic properties of partition functions.**
	
	[A] Eva Belmont, **Holden Lee**, Alexandra Musat, and Sarah Trebat-Leder.

	[Monatshefte für Mathematik, 173(1), 1-34](http://link.springer.com/article/10.1007/s00605-013-0586-y), 2014. [[arXiv](https://arxiv.org/abs/1510.01202), [pdf](https://arxiv.org/pdf/1510.01202.pdf), [presentation](https://www.dropbox.com/s/81413cszqabcwcx/MIT%20presentation.pdf?dl=0), [webpage](l-adic properties of partition functions.html)]
	
# Survey slides

* [Probabilistic foundations for machine learning](https://www.dropbox.com/s/uuc977hxlu1ipe6/probabilistic-foundations-jhu.pdf?dl=0) (Job talk, 2022)
* [Changing the temperature for algorithm design](https://www.dropbox.com/s/gy8huf140rkt414/changing-the-temperature.pdf?dl=0) (Frontiers of Statistical Mechanics and Theoretical Computer Science, 2021/12/14)
