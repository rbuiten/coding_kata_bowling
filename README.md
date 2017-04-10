# coding kata exercise bowling

This is a coding kata exercise for bowling. A basic framework is already provided, BUT there must something be done.

A bowling game does have 10 frames. In each frame the player has
two opportunities to knock down 10 pins. The score for the frame is the total
number of pins knocked down, plus bonuses for strikes and spares.

A strike is when the player knocks down all 10 pins on his first try. The bonus
for that frame is the value of the next two balls rolled.

A spare is when the player knocks down all 10 pins in two tries. The bonus for
that frame is the number of pins knocked down by the next roll.

In the last frame a player who rolls a spare or strike is allowed to roll the extra
balls to complete the frame. However no more than three balls can be rolled in
tenth frame.

“Business rules”
 - player could throw two balls per frame
 - It’s not allowed to throw three times a row 
 - each roll must be between 0 and 10 including 0 and 10.
 - a game contains 10 frames, but could be changed in future