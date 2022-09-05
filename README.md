# parallel_machine_scheduling_with_SA
This project applies Simulated Annealing (SA) meta-heuristic algorithm for solving a parallel machines scheduling problem, coded in MATLAB 2013a.

In a parallel machine scheduling problem, we have several jobs to be processed on some available resources (machines). Each job needs only one machine for completion. In the problem addressed in this project, The aim is to answer these two questions: which machine should be assigned to each job? And what is the best order for processing the jobs on the machines, for minimizing the makespan? Since this problem is NP-hard, using exact methods to solve it (such as solving the mathematical model of the problem) will be very time-consuming. Therefore, using meta-heuristic algorithms can be effective.
In this regard, the Simulated Annealing (SA) algorithm was used in this project. Inspired by the annealing procces in metals, SA generates random solutions in each step. These solutions will be accepted if they reduce the makespan. If they increase it, they will be accepted with a certain probability. By doing this, the possibility of the algorithm getting stuck in the local extreme points is reduced.
The initial solution of the algorithm was randomly generated. The next solution was generated in the neighborhood of the previous ones using Senthilkumar & Narayanan's (2011) method. 

References:

Senthilkumar, P., & Narayanan, S. (2011). Simulated annealing algorithm to minimize makespan in single machine scheduling problem with uniform parallel machines. Intelligent Information Management, 3(01), 22.
