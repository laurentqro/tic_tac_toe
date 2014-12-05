# Tic Tac Toe

**A game that allows a human to play TicTacToe against an unbeatable computer player. The computer player never loses and wins whenever possible.**

---

###### Usage

* Clone the repository: `git clone git@github.com:laurentqro/tic_tac_toe.git`
* `cd` into the cloned repository.
* To run the program, type `bin/play_ttt`.
* If the program fails to run due to permissions, type `chmod a+x bin/play_ttt`

###### Tests

* Unit tests with [RSpec](https://github.com/rspec/rspec).

---

### Computer player's strategy

The computer plays a perfect game of Tic-tac-toe (i.e. win or, at best, draw) by choosing the first available move from the following list:

* **Win**: If it has two in a row, it places a third to get three in a row.

* **Block**: If the opponent has two in a row, it plays the third space itself to block the opponent.

* **Fork**: It creates an opportunity where it has two threats to win (two non-blocked lines of two).

* **Block opponent's fork**: If there is a configuration where the opponent can fork, it blocks that fork, choosing the first available move from the following two options:

    * **option 1**:  it creates two in a row to force the opponent into defending, as long as it does not result in creating a fork for the opponent.

    * **option 2**: if the opponent can fork, it blocks that fork.

* **Center**: It marks the center.

* **Opposite corner**: If the opponent is in the corner, it plays the opposite corner.

* **Empty corner**: It plays in a corner square.

* **Empty side**: It plays in a middle square on any of the four sides.