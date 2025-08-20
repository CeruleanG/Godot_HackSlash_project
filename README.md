# About this project
This is a work-in-progress Hack-n-Slash game developpement project. It serves as an opportinity to learn coding as well as project management.

The game is being made using the game engine Godot (GDScript). The goal is to complete a game combining the platformer's moveability and fighting game's combo mechanic to create a smooth hack-n-slash game experience with skilling ceiling.

The concept of the game is where the player controls a character and fights an initially over-powered boss enemy. Through multiple respawns, the player can updrage the character and learn the move of the enemy and finally beat the boss thus finishign the game.

# Current progress
<img src="https://media.giphy.com/media/HCmg5z4pUtnbxRkrUg/giphy.gif" width="300">
<img src="https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbm11MjhmZDYybDluYnozNnQzdmV5MHh2dGtrbm9scmZ4d2k4NTBkcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ymr3zh2FGL2Vvpddtd/giphy.gif" width="300">

Basic character control logic has been implemented. Player can control the character to move, jump, dash as well as performing a 3-steps attack. Player can be hurt and die.

A enemy has been implemented. It loops between two attack modes with a few seconds in between: it either charges the character and swing its weapon or retreats and shoots bullets at the character.



# Future plan
1. Add story
2. Replace placeholder texutre

# Known issues
None


# Lesson learned
1. Use state machine logic to keep the scalability of the code, multiple cascades of "if" statement will quickly create confusion going into the developpement process.
2. Pre-plan the class structure. Coding efficiency can be drastically improved if proper custom class are thought before-hand in order to not only reduce duplicant code but also allow dev to better understand why an object is coded in such a way.
3. "Call down, signal up", having a clear general logic when it comes how nodes communicate with each other will drastically increase extensibility and maintainability.
