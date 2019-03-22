function [V,F,P,W] = generateProblem_1()


% triangulation
V = [2 0; 
    2 1; 
    1 2; 
    0 1; 
    0 0; 
    1 .6];

F = [1 2 6; 
    2 3 6; 
    3 4 6; 
    4 5 6; 
    5 1 6];

% boundary constraints
P = [2 0; 
    2 1; 
    1 0.8; 
    0 1; 
    0 0; 
    nan nan];

% weights
W = [
    0 1 0 0 1 1;
    1 0 1 0 0 1;
    0 1 0 1 0 1;
    0 0 1 0 1 1;
    1 0 0 1 0 1;
    1 .1 .1 .2 1.2 0;
    ];