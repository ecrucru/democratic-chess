
# The democratic chess engine

> An UCI engine that asks democratically many other engines for the best move to play

This script is an adapter between your chess GUI and your favorite UCI engines defined in the source code directly. The best move is returned at the majority once all the engines have expressed their choice.

You cannot use the protocol XBoard for the connected engines.


## Install

- Install NodeJS.org
- Install the compiler with `npm install -g coffeescript`
- Edit the script `democracy.coffee` to define the chess engines to be used
	- The identation of the source code matters !
	- Please note that every single character `\` should be written as `\\`.
- Run the command `coffee -b -c democracy.coffee` to generate the executable file
- Use the command `node democracy.js` in your favorite chess application

In case you rather use the published JavaScript file, you need to install NodeJS and edit the file `democracy.js` to define the options and the engines to be used.


## License

```
The democratic chess engine
Copyright (C) 2018, ecrucru

	https://github.com/ecrucru/democratic-chess/

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
```


## Sample games

```
[Event "Democratic demo"]
[Site "Home"]
[Date "2018.11.03"]
[Round "1"]
[White "Stockfish"]
[Black "Democracy"]
[Result "1-0"]

{Stockfish plays against a full team : Komodo, Booot, Andscacs, Gull, Houdini,
Critter, Arasan, Rybka, Spike, Toga2, Ruffian and SOS}
1. e4 c5 2. Nf3 d6 3. d4 cxd4 4. Nxd4 Nf6 5. Nc3 {Opening book} 5... e5 6. Bb5+
Bd7 7. Bxd7+ Qxd7 8. Nde2 Be7 9. Ng3 Nc6 10. Nf5 Nxe4 11. Nxg7+ Kf8 12. Bh6 Nxc3
13. bxc3 Rg8 14. Qd3 e4 15. Qg3 f6 16. Nf5+ Kf7 17. Qh3 Rg6 18. Bf4 Kf8 19.
O-O-O d5 20. Nxe7 Qxe7 21. Rxd5 Ne5 22. Rhd1 Nc4 23. R1d4 Ne5 24. Rd7 Qa3+ 25.
Kb1 Nxd7 26. Rxd7 Qa6 27. Bd6+ Qxd6 28. Rxd6 Rg7 29. Rxf6+ Kg8 30. Qe6+ Kh8 31.
Qxe4 Rd8 32. Qe5 Kg8 33. Qe6+ Kh8 34. Qe5 Kg8 35. Qe6+ Kh8 36. g3 a6 37. Rf7
Rdg8 38. Qe5 b6 39. Ra7 a5 40. Rb7 b5 41. Rxb5 h6 42. Rxa5 Kh7 43. Qf5+ Rg6 44.
Ra6 Rg7 45. h4 Kg8 46. Ra8+ Kh7 47. h5 Rb7+ 48. Kc1 Rg7 49. hxg6+ Rxg6 50. Ra7+
Kh8 51. Qf8+ Rg8 52. Qxh6# 1-0
```

```
[Event "Democratic demo"]
[Site "Home"]
[Date "2018.11.03"]
[Round "2"]
[White "Democracy"]
[Black "Stockfish"]
[Result "0-1"]

{Stockfish plays against opponents having more than 3000 ELO : Komodo, Booot,
Andscacs, Gull, Houdini, Critter and Arasan}
1. e4 e6 2. d4 d5 3. Nd2 c5 4. Ngf3 cxd4 5. exd5 {Opening book} 5... Qxd5 6. Bc4
Qd6 7. O-O Nf6 8. Nb3 Nc6 9. Nbxd4 Nxd4 10. Nxd4 Bd7 11. b3 Qb8 12. Nf3 Bc6 13.
Bb2 Bd6 14. g3 Qc7 15. Nd4 O-O-O 16. Qe2 a6 17. Nxc6 Qxc6 18. Rad1 h5 19. h4 Rd7
20. Bd3 Rhd8 21. a3 Ng4 22. Be4 Qc7 23. Kg2 Be5 24. Rxd7 Rxd7 25. Bxe5 Qxe5 26.
Re1 Qd4 27. Bf3 g6 28. a4 Qc3 29. Qe4 Nf6 30. Qe5 Qxe5 31. Rxe5 Rc7 32. c4 Nd7
33. Re3 a5 34. Bd1 Rc6 35. Bc2 Rd6 36. Kf3 Kc7 37. Ke2 f5 38. f4 Kc6 39. Rd3
Rxd3 40. Kxd3 Kc5 41. Bd1 Kb4 42. Kc2 Nc5 43. Bf3 Ne4 44. Bd1 Nxg3 45. Kd3 Ne4
46. Kc2 Nf2 47. Bf3 b6 48. Bg2 Kc5 49. Kc3 Ne4+ 50. Kd3 Kb4 51. Kc2 Kc5 52. Kd3
Kb4 53. Kc2 Nf2 54. Bf1 Kc5 55. Kc3 Ne4+ 56. Kb2 Kd4 57. Ka3 Nd2 58. Bg2 Ke3 59.
Bc6 Kxf4 60. Kb2 Ke3 61. Bd7 e5 62. Kc3 Ne4+ 63. Kc2 f4 64. Bh3 f3 65. b4 axb4
66. Kb3 g5 67. hxg5 Nxg5 68. Bf1 h4 69. a5 bxa5 70. c5 e4 71. c6 Ne6 72. Kc4 Kf4
73. Bh3 f2 74. Bxe6 f1=Q+ 75. Kc5 Qf2+ 76. Kb5 Qa7 77. Ka4 Qb6 78. Kb3 a4+ 79.
Kb2 Qe3 80. Kb1 Qc3 81. Ba2 a3 82. c7 Qb2# 0-1
```

```
[Event "Democratic demo"]
[Site "Home"]
[Date "2018.11.07"]
[Round "3"]
[White "Democracy"]
[Black "Komodo"]
[Result "1/2-1/2"]

{Stockfish is undefeated. Let's try to beat Komodo with a team made of : Booot,
Andscacs, Gull, Houdini, Critter, Arasan, Rybka, Spike, Toga2, Ruffian and SOS}
1. e4 e5 2. Nc3 Nf6 3. Nf3 Nc6 4. Bc4 Bc5 5. d3 O-O 6. O-O h6 7. Be3 Bxe3 8.
fxe3 d6 9. d4 a6 10. Bd5 Nxd5 11. exd5 exd4 12. exd4 Ne7 13. Qe2 Re8 14. Qf2 b5
15. a3 Qd7 16. Nh4 f6 17. Rae1 Bb7 18. Qf3 a5 19. b4 c5 20. dxc6 Bxc6 21. d5
axb4 22. axb4 Bb7 23. Qd3 Ra3 24. Qxb5 Rd8 25. Qxd7 Rxd7 26. Rf3 Nxd5 27. Nxd5
Rxf3 28. Nxf3 Bxd5 29. Nd4 g6 30. b5 Rc7 31. Rd1 Be4 32. Kf2 f5 33. Rd2 Rc4 34.
Ne2 Kf7 35. c3 Ke7 36. Ra2 Rc5 37. Rb2 Kd7 38. Rb3 Bd5 39. Rb2 Kc7 40. b6+ Kb7
41. Rd2 g5 42. Ng3 f4 43. Nf5 Kxb6 44. Nxd6 Kc7 45. Ne8+ Kc6 46. Nf6 Be6 47. Ne4
Rd5 48. Ra2 Re5 49. Ra4 Bb3 50. Rd4 Kc7 51. c4 Ba4 52. h4 Bc6 53. Nc3 Ra5 54.
hxg5 hxg5 55. g3 fxg3+ 56. Kxg3 Kb6 57. Nd5+ Kc5 58. Rg4 Ra3+ 59. Kf2 Ra7 60.
Rxg5 Kxc4 61. Ne3+ Kd3 62. Nf5 Ra4 63. Kg3 Ra2 64. Kf4 Rf2+ 65. Ke5 Rg2 66. Rxg2
Bxg2 1/2-1/2
```
