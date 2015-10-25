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


function [scaledX, stairsX] = oppa(X, algs, varargin)
    % Control algs
    legendX = {};
    if(exist('algs','var'))
        for i=1:size(X,2)
            legendX = algs;
        end
    else
        for i=1:size(X,2) 
            legendX{i} = strcat('Algorithm', int2str(i));
        end
    end
    % Eliminate entries with zero
    X(X(:,:)==0)=inf;
    % Scale every row by dividing its minimum
    scaledX = bsxfun(@rdivide,X,min(X')');
    % Select a border
    upperborder = ceil(max(scaledX(scaledX(:,:)<Inf)));
    % Sort the columns
    stairsX = sort(scaledX);
    % Value array
    stairsX = [ones(1,size(X,2)); stairsX; upperborder*ones(1,size(X,2))];
    % Generate the graphic
    hold all
    linestyles = {'--','-',':','-.'};
    %markers = {'none','o','x','+','*','s','d','v','^','<','>','p','h','.',...
    %'+','*'}
    %set(gca, 'LineStyleOrder', {'-', ':', '--', '-.'}); % different line styles
    set(0,'DefaultAxesColorOrder','remove');
    % Handle the inf
    stairsX(stairsX(:,:)==inf)=upperborder;
    for i=1:size(X,2)
        A = [cumsum(stairsX(:,i)<upperborder)-1]/size(X,1);
        B = stairsX(:,i);
        mplot = stairs(B, A,'LineStyle',linestyles{mod(i,4)+1}, 'LineWidth', 2);
    end
    % Correct the limits
    xlim([1 upperborder]);
    ylim([0 1]);
    set(gca,'FontSize',14)
    set(gca,'xscale','log');
    set(gca,'xtick',2.^(1:log2(upperborder)));
    legend(legendX,'Location','BestOutside');
    title('Log_2 Scaled Performance Profile');
    ylabel('P((log_2 (r_{p,s}) \leq \tau: 1 \leq s \leq n_s )');
    xlabel('\tau');
    box on;
    set(gcf,'units','points','position',[10,10,800,600]);
    
    hold off
    
return



