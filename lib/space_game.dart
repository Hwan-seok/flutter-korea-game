import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter_korea_game/component/made_by_component.dart';
import 'package:flutter_korea_game/component/meteor_component.dart';
import 'package:flutter_korea_game/component/score_component.dart';
import 'package:flutter_korea_game/component/ship_component.dart';
import 'package:flutter_korea_game/gen/assets.gen.dart';

class SpaceGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  @override
  bool get debugMode => false;

  @override
  Future<void>? onLoad() async {
    await loadSprites();

    final myShip = ShipComponent();
    final scoreComponent = ScoreComponent();
    addAll([myShip, scoreComponent, MadeByComponent()]);

    children.register<ScoreComponent>();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    final spawnLevel = size.x / 10000;
    if (Random().nextDouble() < spawnLevel) {
      add(MeteorComponent());
    }
    super.update(dt);
  }

  void gameOver() {
    overlays.add("game_over");
    pauseEngine();
  }

  Future<void> loadSprites() async {
    images.prefix = '';
    await images.loadAll([
      Assets.images.meteor.path,
      Assets.images.player.path,
      Assets.images.playerDamaged.path,
      Assets.images.playerLeft.path,
      Assets.images.playerRight.path,
    ]);
  }
}
