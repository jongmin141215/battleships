# Battleships game

## Description of project

Basic prototype of a Battleships game: boards and ships.

## Domain model

### class Board

* knows its cells and whether or not they are occupied
* knows its ships
* prevents its ships from overlapping

collaborates with: Ship

### class Ship

* knows/tells which board it is on, if any
* can check if it has a location assigned
* knows/tells which cells it occupies if so

collaborates with: Board
