%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%       GRUPO NUM: 37
%
%       ALUNOS: Antonio Tavares - no. 78122
%		Luis Borges	- no. 78349
%		Paulo Ritto	- no. 78929
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------------------------------------------------------------
%
%                            Pistas Intermedias
%
%---------------------------------------------------------------------

%---------------------------------------------------------------------
% A implementacao dos predicados seguintes e feita recorrendo ao predicado
% coloca. Apenas ha que ter em conta a informacao sobre a linha ou
% a coluna em causa (ou ambas) e acrescentar os casos implicitos.
%---------------------------------------------------------------------



trioLeft(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

trioRight(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

cobra(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

tSimples(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, center, Coluna, Tabuleiro)).

tLeft(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

tRight(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

tInvertido(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, center, Coluna, Tabuleiro);
	 coloca(A, top, Coluna, Tabuleiro)).

cantoTopLeft(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, center, middle, Tabuleiro);
	 coloca(A, center, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

cantoTopRight(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, center, middle, Tabuleiro);
	 coloca(A, center, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

cantoBottomLeft(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, center, middle, Tabuleiro);
	 coloca(A, center, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

cantoBottomRight(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, center, middle, Tabuleiro);
	 coloca(A, center, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro)).

diagonalGrave(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro);
	 coloca(A, center, Coluna, Tabuleiro);
	 coloca(A, center, middle, Tabuleiro)).

diagonalAguda(A, Linha, Coluna, Tabuleiro) :-
	(coloca(A, Linha, Coluna, Tabuleiro);
	 coloca(A, Linha, middle, Tabuleiro);
	 coloca(A, center, Coluna, Tabuleiro);
	 coloca(A, center, middle, Tabuleiro)).


%---------------------------------------------------------------------
%
%                            Predicado check/2
%
%---------------------------------------------------------------------

%---------------------------------------------------------------------
% O predicado check/2 recebe um tabuleiro eventualmente incompleto e
% devolve o tabuleiro totalmente preenchido, ao unificar o tabuleiro
% com uma permutacao das nove pecas possiveis.
%---------------------------------------------------------------------

check(Tabuleiro,TabuleiroFinal) :-
	Pecas = [peca(circulo,vermelho),peca(triangulo,vermelho),peca(quadrado,vermelho),peca(circulo,azul),peca(triangulo,azul),peca(quadrado,azul),peca(circulo,amarelo),peca(triangulo,amarelo),peca(quadrado,amarelo)],
	perm(Pecas, TabuleiroFinal),
	TabuleiroFinal = Tabuleiro.


%---------------------------------------------------------------------
%
%                            Predicados Auxiliares
%
%---------------------------------------------------------------------

%---------------------------------------------------------------------
% 1 - escolhe(L1, E, L2) afirma que L2 e a lista que se obtem de L1
% retirando-lhe o elemento E.
%
% 2 - perm(L1, L2) afirma que L1 e L2 correspondem a listas com os mesmos
% elementos mas com os elementos por ordem diferente.
%---------------------------------------------------------------------

escolhe([P | R], P, R).
escolhe([P | R], E, [P | S]) :-
	escolhe(R, E, S).

perm([], []).
perm(L, [P | R]) :-
	escolhe(L, P, L1),
	perm(L1, R).



