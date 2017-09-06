%
% Compute the size of the network, i.e. the number of nodes.
%
% PARAMETERS 
%	A	Adjacency or biadjacency matrix
%	format
%	weights
%
% RESULT 
%	values	Column vector of values
%		[1]	Total number of vertices
%		[2]	BIP:  Number of vertices in left group
%		[2]	ASYM: Number of vertices with nonzero outdegree
%		[3]	BIP:  Number of vertices in right group
%		[3]	ASYM: Number of vertices with nonzero indegree
%
% GROUP+2:  bip
% GROUP+3:  bip
%

function values = konect_statistic_size(A, format, weights)

consts = konect_consts();

A = A ~= 0; 

if format == consts.SYM || format == consts.ASYM

    assert(size(A, 1) == size(A, 2)); 
    values = size(A, 1);

elseif format == consts.BIP

    values = [ sum(size(A)); size(A, 1); size(A, 2) ]; 

else

    error('*** Invalid format'); 

end
