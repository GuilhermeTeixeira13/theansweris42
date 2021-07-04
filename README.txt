# theansweris42
-----------------------------------------------------------------------------------------------------------------------
* Problem *
Let's play a simple game involving money. If I give you an initial sum, let's say N euros, you must return me money from this sum according to pre-established rules. If you can, with these rules you have exactly 42 euros in hand, you won the game and keep this sum.

If we assume you have m euros in hand, the rules are:
• (rule 1) if m is even, you can return m/2 euros;
• (rule 2) if m is a multiple of 3 or 4 then you can multiply the last two digits of m and return this amount to me in euros;
• (rule 3) if m is a multiple of 5 then you can return me exactly 42 euros.
-----------------------------------------------------------------------------------------------------------------------
Input -> A line with an integer N, the sum initially proposed for the game.
-----------------------------------------------------------------------------------------------------------------------
Output
One of this two:
• a line with an integer p that represents the minimum number of steps (the number of rules) who used to win the game;
• or a line with the text BAD LUCK, if you cannot win.
-----------------------------------------------------------------------------------------------------------------------
Limits
0 < N < 1 000 000
-----------------------------------------------------------------------------------------------------------------------
Input Example
250
Output Example
4
Explanation
250 (rule 3) → 208 (rule 1) → 104 (rule 1) → 52 (rule 2) → 42
