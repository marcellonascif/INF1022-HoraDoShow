/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INT = 258,
     ID = 259,
     RECEBA = 260,
     DEVOLVA = 261,
     VIRG = 262,
     EQUAL = 263,
     ADD = 264,
     SUB = 265,
     MUL = 266,
     DIV = 267,
     HORADOSHOW = 268,
     AQUIACABOU = 269,
     EXECUTE = 270,
     VEZES = 271,
     FIMEXE = 272,
     SE = 273,
     ENTAO = 274,
     FIMSE = 275,
     SENAO = 276,
     ENQUANTO = 277,
     FACA = 278,
     FIMENQUANTO = 279,
     COMPARE = 280
   };
#endif
/* Tokens.  */
#define INT 258
#define ID 259
#define RECEBA 260
#define DEVOLVA 261
#define VIRG 262
#define EQUAL 263
#define ADD 264
#define SUB 265
#define MUL 266
#define DIV 267
#define HORADOSHOW 268
#define AQUIACABOU 269
#define EXECUTE 270
#define VEZES 271
#define FIMEXE 272
#define SE 273
#define ENTAO 274
#define FIMSE 275
#define SENAO 276
#define ENQUANTO 277
#define FACA 278
#define FIMENQUANTO 279
#define COMPARE 280




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 13 "parser.y"
{
  int ival;
  char *sval;
}
/* Line 1529 of yacc.c.  */
#line 104 "parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

