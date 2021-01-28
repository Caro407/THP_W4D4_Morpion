# Sommaire

- [Super morpion de la mort qui tue](#orgdc13872)
  - [Description](#orgb5978c3)
  - [Architecture](#orgb6806c0)
    - [`Application`](#org38bc1ae)
    - [`Game`](#org93de329)
    - [`Board`](#org2b38a94)
    - [`BoardView`](#org2d85efc)
    - [`BoardCase`](#orgeb1ed0f)
    - [`Player`](#orgeaba15f)
  - [Rendu](#orgdef715b)


<a id="orgdc13872"></a>

# Super morpion de la mort qui tue


<a id="orgb5978c3"></a>

## Description

Permet de jouer autant qu'on le souhaite une partie de morpion à deux joueurs.

La durée d'une partie est d'environ 25min.


<a id="orgb6806c0"></a>

## Architecture


<a id="org38bc1ae"></a>

### `Application`

Responsable de lancer des partie et de rejouer, elle manipule des `Games`

Elle contient une boucle de **replay** qui permet de relancer une game :

```ruby
21  def loop_games
22      players_wanna_play = true
23      while players_wanna_play == true
24        game = Game.new
25        players_wanna_play = restart?
26      end
27  end
```


<a id="org93de329"></a>

### `Game`

Responsable d'initializer les joueurs et le board et toutes leur intéractions.

Elle contient la boucle principale du jeu à savoir la mécanique de tour par tour.


<a id="org2b38a94"></a>

### `Board`

Il s'occupe de générer les cases du morpions et leur manipulation, dont :

-   Le remplissage d'une case par un joueur
-   L'évaluation des conditions de victoire (par ligne, colonne ou diagonale)


<a id="org2d85efc"></a>

### `BoardView`

Est une classe qui vient se greffer sur un board pour générer sa visualisation.

C'est une classe utilitaire pour aider le joueur humain à lire l'état du jeu.


<a id="orgeb1ed0f"></a>

### `BoardCase`

Sert à définir les cases du morpion. En l'état, elle ne contiennent qu'un attribut `inner_content` qui représente leur contenu.


<a id="orgeaba15f"></a>

### `Player`

Il sert d'interface avec le joueur humain. Défini par un nom (`name`) et un symbol (`symbole`), elle permet de lui demander quelle case il souhaite remplir.


<a id="orgdef715b"></a>

## Rendu

-   [X] Possibilité de jouer une partie entière de morpion
-   [X] Deux joueurs humains
-   [X] Tableau de neuf cases (A1 &#x2013;> C3)
-   [X] Le programme détecte la fin de partie (avec victoire ou match nul)
-   [X] Le programme propose de relancer une partie
-   [X] Visuel travaillé pour être agréable
