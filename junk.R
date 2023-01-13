\section*{Malaria Infection Dynamics}

The simplicity of $M/M/infty$ makes it attractive analytically, but the need for a tractable and practical computational approach to malaria epidemiology will often require making approximations. The distinct phases of parasite growth -- acute phase followed by chronic decline -- suggests different factors are at work over time time course of an infection (Fig.~ \ref{fig:phases}). To deal with an incubation, and the remainder of the post-incubation growth phase, we have expanded the epidemiological state space. Let $U$ denote the fraction uninfected, $X_1$ in the post-incubation period growth phase, and $X_2$ in the chronic phase. Similarly, let $E$, $S_1$, and $S_2$ denote the fraction that are carrying incubating infections but that would otherwise be in the states $U$, $X_1$, and $X_2$, respectively. We let $\nu_e^{-1}$ denote the average duration of the incubation period ($\approx 10 d)$, and $\nu_g^{-1}$ the average duration of the remainder of the growth phase ($\approx 10 d)$. In this space, the dynamics are: 
  %
\begin{equation}
\begin{array}{rl}
dU/dt &= - h U + R(m) (X_1 + X_2) \\
dX_1/dt &= \nu_e (E + S_1 + S_2) - (h+\nu_g+R(m)) X_1 \\ 
dX_2/dt &= \nu_g X_1  - (h+R(m)) X_2 \\ 
dE/dt &= h U  + R(m) (S_1 + S_2)  - \nu_e E \\
dS_1/dt &= h X_1 - (\nu_e + \nu_g + R(m)) S_1 \\ 
dS_2/dt &= h X_2 + \nu_g S_1 - (\nu + R(m)) S_2 \\ 
\end{array}
\end{equation}

\section*{Malaria Epidemiology} 

In the sections above, we have introduced a set of variables that track features of a queuing model for super-infection (Eqs~\ref{dmdt}, \ref{dXdt}, \ref{dAdt}, and \ref{dYdt}), 
The basic model for the dynamics of malaria infection, immunity, and parasite densities and detection can be fit to most kinds of data. 



{\bf NOTES:} Once again, we note that the variables $A$ and $A'$ are redundant. In the functions below, we'd like to show that we can develop reasonable models of parasite densities given $X$, $m$, and $A'$ (or perhaps some other tracking variable), without needing the full distribution given in Eq.~\ref{xad}.






\subsection*{{\em Pf}PR by Age}

{\bf NOTE:} Do we need a simulation figure showing detection vs. h, or perhaps it would be part of Fig3.  

We modify Eq.~\ref{hatp} to include the effects of cumulative exposure, and parasite population diversity, $\vec V = \left<m, A, V_X V_P \right>$. We let mean parasite densities decline from a maximum $\hat p$ as a function of:
%
\begin{equation}
\log(p) = \hat p e^{ -\left(s_A A + s_X  \frac{V_X}{V_p}  \right)} 
\label{hatpV}
\end{equation}
%
with the same scaling relationship on the variance. 

This functional form was selected from a family of models fitted to parasite densities {\em vs.} age across three sites in Uganda (Figure 2, Supplement 3).

\subsection*{Malaria Incidence and Clinical Immunity}

%
{\bf NOTE:} Given $P_s$, we want to write $p$ and $v$ as a function of the tracking variables: such as:   

We note that the $\log_{10}$ of the arithmetic sum of parasite densities $P_i$ with expected value $10^p_i$ is close to $\max_i \left\{p_i \right\}$ which scales with $A'$, that if there are many infections of approximately the same age, that the expectation increases with $\log_{10}(m)$. The variance changes dramatically with the MoI.  


