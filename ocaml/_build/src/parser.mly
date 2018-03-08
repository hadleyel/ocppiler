%{
open Lang
%}

%token <int> INT
%token <bool> BOOL

%token IF         (* if *)
%token THEN       (* then *)
%token ELSE       (* else *)
%token LEQ        (* <= *)
%token MINUS      (* - *)
%token PLUS       (* + *)
%token DIVIDE     (* / *)
%token TIMES      (* * *)
%token LPAREN     (* ( *)
%token RPAREN     (* ) *)
%token EOF

%left LEQ
%left MINUS PLUS
%left DIVIDE TIMES

%start <Lang.exp> prog

%%

prog:
  | e=exp EOF                           { e }

exp:
  | n=INT                   { EInt n }
  | b=BOOL                  { EBool b }
  | LPAREN e1=exp RPAREN    { e1 }
  | IF e1=exp THEN e2=exp ELSE e3=exp { EIf (e1, e2, e3)}
  | e1=exp LEQ e2=exp       { ELeq (e1, e2) }
  | e1=exp MINUS e2=exp     { ESub (e1, e2) }
  | e1=exp PLUS e2=exp      { EAdd (e1, e2) }
  | e1=exp DIVIDE e2=exp    { EDiv (e1, e2) }
  | e1=exp TIMES e2=exp     { ETim (e1, e2) }