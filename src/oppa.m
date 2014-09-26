%OPPA  Generates figures for optimization performance profiling
% 
% Syntax:
%   oppa(X)
%   oppa(X, algs)
%   oppa(X, algs, varargin)
%   [scaledX, stairsX] = oppa(X, algs, varargin)
% 
% Description:
%
%   oppa(X) calls the performance profiling algorithm presented by
%   Elizabeth D. Dolan and Jorge J. More.
%   It takes the performance measure as an input and generate the
%   associated figures.
%
%   [scaledX, stairsX] = oppa(X, algs, settings) also enables usage of
%   pre-defined algorithm names and also pre-defined plot properties.
%   Function returns the scaled values of the measures and their
%   corresponding values in the performance profile.
%   
% Input Arguments
%   X         - Performance measure matrix. Rows of X should represent
%               experiments and columns represent algorithms/software to be
%               compared.
%   algs      - Names of the algorithms for graphic legend
%   varargin  - Plot(stairs) function properties  
%
% Examples:
%   
% Output Arguments
%   
%   See also STAIRS.
% 
% Sertalp B. Cay, Pelin Cay 2014
% 


[scaledX, stairsX] = oppa(X, algs, varargin)


return