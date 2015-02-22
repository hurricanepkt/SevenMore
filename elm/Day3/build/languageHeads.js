Elm.LanguageHead = Elm.LanguageHead || {};
Elm.LanguageHead.make = function (_elm) {
   "use strict";
   _elm.LanguageHead = _elm.LanguageHead || {};
   if (_elm.LanguageHead.values)
   return _elm.LanguageHead.values;
   var _op = {},
   _N = Elm.Native,
   _U = _N.Utils.make(_elm),
   _L = _N.List.make(_elm),
   _A = _N.Array.make(_elm),
   _E = _N.Error.make(_elm),
   $moduleName = "LanguageHead",
   $Basics = Elm.Basics.make(_elm),
   $Color = Elm.Color.make(_elm),
   $Graphics$Collage = Elm.Graphics.Collage.make(_elm),
   $Graphics$Element = Elm.Graphics.Element.make(_elm),
   $Keyboard = Elm.Keyboard.make(_elm),
   $List = Elm.List.make(_elm),
   $Mouse = Elm.Mouse.make(_elm),
   $Random = Elm.Random.make(_elm),
   $Signal = Elm.Signal.make(_elm),
   $String = Elm.String.make(_elm),
   $Text = Elm.Text.make(_elm),
   $Time = Elm.Time.make(_elm);
   var txt = function (f) {
      return function ($) {
         return $Text.leftAligned(f($Text.monospace($Text.color($Color.blue)($Text.toText($)))));
      };
   };
   var fullScore = function (player) {
      return A2(txt,
      $Text.height(50),
      $String.show(player.score));
   };
   var half = function (x) {
      return $Basics.toFloat(x) / 2;
   };
   var drawScore = F3(function (w,
   h,
   player) {
      return $Graphics$Collage.move({ctor: "_Tuple2"
                                    ,_0: half(w) - 150
                                    ,_1: half(h) - 40})($Graphics$Collage.toForm(fullScore(player)));
   });
   var drawPaddle = F3(function (w,
   h,
   x) {
      return $Graphics$Collage.moveY(0 - (half(h) - 30))($Graphics$Collage.moveX(x + 10 - half(w))(A2($Graphics$Collage.filled,
      $Color.black,
      A2($Graphics$Collage.rect,
      80,
      10))));
   });
   var drawHead = F3(function (w,
   h,
   head) {
      return function () {
         var src = head.img;
         var y = half(h) - head.y;
         var x = half(w) - head.x;
         return $Graphics$Collage.rotate($Basics.degrees(x * 2 - 100))($Graphics$Collage.move({ctor: "_Tuple2"
                                                                                              ,_0: 0 - x
                                                                                              ,_1: y})($Graphics$Collage.toForm(A3($Graphics$Element.image,
         75,
         75,
         src))));
      }();
   });
   var drawHeads = F3(function (w,
   h,
   heads) {
      return A2($List.map,
      A2(drawHead,w,h),
      heads);
   });
   var drawBuilding = F2(function (w,
   h) {
      return $Graphics$Collage.moveX(0 - half(w) + 50)($Graphics$Collage.toForm(A3($Graphics$Element.image,
      100,
      h,
      "img/Brick.jpg")));
   });
   var drawRoad = F2(function (w,
   h) {
      return $Graphics$Collage.moveY(0 - half(h) + 50)($Graphics$Collage.toForm(A3($Graphics$Element.image,
      w,
      100,
      "img/Asphalt.jpg")));
   });
   var complete = function (_v0) {
      return function () {
         return _U.cmp(_v0.x,750) > 0;
      }();
   };
   var stepScore = F2(function (player,
   heads) {
      return player.score + 1 + 1000 * $List.length(A2($List.filter,
      complete,
      heads));
   });
   var stepPlayer = F3(function (player,
   mouseX,
   heads) {
      return _U.replace([["score"
                         ,A2(stepScore,player,heads)]
                        ,["x",$Basics.toFloat(mouseX)]],
      player);
   });
   var removeComplete = function (heads) {
      return A2($List.filter,
      function (x) {
         return $Basics.not(complete(x));
      },
      heads);
   };
   var delta = A2($Signal._op["<~"],
   $Time.inSeconds,
   $Time.fps(50));
   var secsPerFrame = 1.0 / 50.0;
   var moveHead = function (_v2) {
      return function () {
         return _U.replace([["x"
                            ,_v2.x + _v2.vx * secsPerFrame]
                           ,["y"
                            ,_v2.y + _v2.vy * secsPerFrame]
                           ,["vy"
                            ,_v2.vy + secsPerFrame * 400]],
         _v2);
      }();
   };
   var moveHeads = F2(function (delta,
   heads) {
      return A2($List.map,
      moveHead,
      heads);
   });
   var bottom = 550;
   var headSafe = F2(function (x,
   head) {
      return _U.cmp(head.y,
      bottom) < 0 || _U.cmp($Basics.abs(head.x - x),
      50) < 0;
   });
   var allHeadsSafe = F2(function (x,
   heads) {
      return A2($List.all,
      headSafe(x),
      heads);
   });
   var bounce = function (head) {
      return _U.replace([["vy"
                         ,_U.cmp(head.y,
                         bottom) > 0 && _U.cmp(head.vy,
                         0) > 0 ? (0 - head.vy) * 0.95 : head.vy]],
      head);
   };
   var bounceHeads = function (heads) {
      return A2($List.map,
      bounce,
      heads);
   };
   var headImage = function (n) {
      return _U.eq(n,
      0) ? "/img/brucetate.png" : _U.eq(n,
      1) ? "/img/davethomas.png" : _U.eq(n,
      2) ? "/img/evanczaplicki.png" : _U.eq(n,
      3) ? "/img/joearmstrong.png" : _U.eq(n,
      4) ? "/img/josevalim.png" : "";
   };
   var defaultHead = function (n) {
      return {_: {}
             ,img: headImage(n)
             ,vx: 0
             ,vy: 0.0
             ,x: 100.0
             ,y: 75};
   };
   var spawnHead = F3(function (score,
   heads,
   rand) {
      return function () {
         var addHead = _U.cmp($List.length(heads),
         (score / 5000 | 0) + 1) < 0 && A2($List.all,
         function (head) {
            return _U.cmp(head.x,
            107.0) > 0;
         },
         heads);
         return addHead ? A2($List._op["::"],
         defaultHead(rand),
         heads) : heads;
      }();
   });
   var stepHeads = F5(function (heads,
   delta,
   x,
   score,
   rand) {
      return moveHeads(delta)(removeComplete(bounceHeads(A3(spawnHead,
      score,
      heads,
      rand))));
   });
   var Game = F3(function (a,b,c) {
      return {_: {}
             ,heads: b
             ,player: c
             ,state: a};
   });
   var Player = F2(function (a,b) {
      return {_: {},score: b,x: a};
   });
   var Head = F4(function (a,
   b,
   c,
   d) {
      return {_: {}
             ,vx: c
             ,vy: d
             ,x: a
             ,y: b};
   });
   var Input = F4(function (a,
   b,
   c,
   d) {
      return {_: {}
             ,delta: c
             ,rand: d
             ,space: a
             ,x: b};
   });
   var input = A2($Signal.sampleOn,
   delta,
   A2($Signal._op["~"],
   A2($Signal._op["~"],
   A2($Signal._op["~"],
   A2($Signal._op["<~"],
   Input,
   $Keyboard.space),
   $Mouse.x),
   delta),
   A3($Random.range,
   0,
   4,
   $Time.every(secsPerFrame))));
   var GameOver = {ctor: "GameOver"};
   var Pause = {ctor: "Pause"};
   var defaultGame = {_: {}
                     ,heads: _L.fromArray([])
                     ,player: {_: {},score: 0,x: 0.0}
                     ,state: Pause};
   var stepGameFinished = F2(function (_v4,
   _v5) {
      return function () {
         return function () {
            return _v4.space ? defaultGame : _U.replace([["state"
                                                         ,GameOver]
                                                        ,["player"
                                                         ,_U.replace([["x"
                                                                      ,$Basics.toFloat(_v4.x)]],
                                                         _v5.player)]],
            _v5);
         }();
      }();
   });
   var stateMessage = function (state) {
      return _U.eq(state,
      GameOver) ? "Game Over" : _U.eq(state,
      Pause) ? "Press Space" : "Language Head";
   };
   var drawMessage = F3(function (w,
   h,
   state) {
      return $Graphics$Collage.move({ctor: "_Tuple2"
                                    ,_0: 50
                                    ,_1: 50})($Graphics$Collage.toForm(A2(txt,
      $Text.height(50),
      stateMessage(state))));
   });
   var display = function (_v8) {
      return function () {
         return function () {
            var $ = {ctor: "_Tuple2"
                    ,_0: 800
                    ,_1: 600},
            w = $._0,
            h = $._1;
            return A3($Graphics$Collage.collage,
            w,
            h,
            _L.append(_L.fromArray([A2(drawRoad,
                                   w,
                                   h)
                                   ,A2(drawBuilding,w,h)
                                   ,A3(drawPaddle,w,h,_v8.player.x)
                                   ,A3(drawScore,w,h,_v8.player)
                                   ,A3(drawMessage,
                                   w,
                                   h,
                                   _v8.state)]),
            A3(drawHeads,w,h,_v8.heads)));
         }();
      }();
   };
   var Play = {ctor: "Play"};
   var stepGameOver = F2(function (x,
   heads) {
      return A2(allHeadsSafe,
      $Basics.toFloat(x),
      heads) ? Play : GameOver;
   });
   var stepGamePlay = F2(function (_v10,
   _v11) {
      return function () {
         return function () {
            return _U.replace([["state"
                               ,A2(stepGameOver,
                               _v10.x,
                               _v11.heads)]
                              ,["heads"
                               ,A5(stepHeads,
                               _v11.heads,
                               _v10.delta,
                               _v10.x,
                               _v11.player.score,
                               _v10.rand)]
                              ,["player"
                               ,A3(stepPlayer,
                               _v11.player,
                               _v10.x,
                               _v11.heads)]],
            _v11);
         }();
      }();
   });
   var stepState = F2(function (space,
   state) {
      return space ? Play : state;
   });
   var stepGamePaused = F2(function (_v14,
   _v15) {
      return function () {
         return function () {
            return _U.replace([["state"
                               ,A2(stepState,
                               _v14.space,
                               _v15.state)]
                              ,["player"
                               ,_U.replace([["x"
                                            ,$Basics.toFloat(_v14.x)]],
                               _v15.player)]],
            _v15);
         }();
      }();
   });
   var stepGame = F2(function (input,
   game) {
      return function () {
         var _v18 = game.state;
         switch (_v18.ctor)
         {case "GameOver":
            return A2(stepGameFinished,
              input,
              game);
            case "Pause":
            return A2(stepGamePaused,
              input,
              game);
            case "Play":
            return A2(stepGamePlay,
              input,
              game);}
         _E.Case($moduleName,
         "between lines 49 and 53");
      }();
   });
   var gameState = A3($Signal.foldp,
   stepGame,
   defaultGame,
   input);
   var main = A2($Signal.lift,
   display,
   gameState);
   _elm.LanguageHead.values = {_op: _op
                              ,Play: Play
                              ,Pause: Pause
                              ,GameOver: GameOver
                              ,Input: Input
                              ,Head: Head
                              ,Player: Player
                              ,Game: Game
                              ,defaultHead: defaultHead
                              ,defaultGame: defaultGame
                              ,headImage: headImage
                              ,bottom: bottom
                              ,secsPerFrame: secsPerFrame
                              ,delta: delta
                              ,input: input
                              ,main: main
                              ,gameState: gameState
                              ,stepGame: stepGame
                              ,stepGamePlay: stepGamePlay
                              ,stepGameOver: stepGameOver
                              ,allHeadsSafe: allHeadsSafe
                              ,headSafe: headSafe
                              ,stepHeads: stepHeads
                              ,spawnHead: spawnHead
                              ,bounceHeads: bounceHeads
                              ,bounce: bounce
                              ,removeComplete: removeComplete
                              ,complete: complete
                              ,moveHeads: moveHeads
                              ,moveHead: moveHead
                              ,stepPlayer: stepPlayer
                              ,stepScore: stepScore
                              ,stepGamePaused: stepGamePaused
                              ,stepGameFinished: stepGameFinished
                              ,stepState: stepState
                              ,display: display
                              ,drawRoad: drawRoad
                              ,drawBuilding: drawBuilding
                              ,drawHeads: drawHeads
                              ,drawHead: drawHead
                              ,drawPaddle: drawPaddle
                              ,half: half
                              ,drawScore: drawScore
                              ,fullScore: fullScore
                              ,txt: txt
                              ,drawMessage: drawMessage
                              ,stateMessage: stateMessage};
   return _elm.LanguageHead.values;
};