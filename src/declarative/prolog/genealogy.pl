/* 
 * AdvPrPa: PL Genealogy using Prolog 
 * Web interpreter: https://swish.swi-prolog.org
 */


/* Facts */
paradigm(lisp, functional).
paradigm(prolog, logic).
paradigm(haskell, functional).
paradigm(java, object_oriented).


/*
TODO 1: Write a query to find all functional languages.
*/


/*
TODO 2: 
Add pascal as a procedural language.
Add smalltalk as an object_oriented language.
*/



/*
TODO 3: 
Add a rule describing all imperative languages. Imperative beeing all
languages which are either procedural or object_oriented.
imperative(L) :- ...

Then use the rule to query all imperative languages:
*/ 


/*
TODO 4:
Find all languages influenced by lisp.
Hint: 
      X influenced Y if X is an ancestor of Y.
   or X influenced Y if X is an ancestor of some intermediate language TMP and TMP influenced Y.
*/
ancestor(lisp, haskell).
ancestor(lisp, smalltalk).
ancestor(smalltalk, java).
ancestor(haskell, idris).
ancestor(haskell, scala).
ancestor(java, scala).



/*
TODO 5:
Add your favorite languages to the database and ask some queries.

https://digibarn.com/collections/posters/tongues/ComputerLanguagesChart.png
http://cdn.oreillystatic.com/news/graphics/prog_lang_poster.pdf
*/

