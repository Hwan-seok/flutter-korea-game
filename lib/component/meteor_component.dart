import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_korea_game/component/score_component.dart';
import 'package:flutter_korea_game/gen/assets.gen.dart';
import 'package:flutter_korea_game/space_game.dart';

class MeteorComponent extends SpriteComponent with HasGameRef<SpaceGame> {
  final double speed;
  final double rotationalSpeed;

  MeteorComponent({super.anchor = Anchor.center})
      : speed = Random().nextDouble(),
        rotationalSpeed = Random().nextDouble();

  @override
  Future<void>? onLoad() async {
    sprite = Sprite(gameRef.images.fromCache(Assets.images.meteor.path));
    position = Vector2(Random().nextDouble() * gameRef.size.x, 100);
    size = Vector2.all(88 * Random().nextDouble());
    add(
      CircleHitbox.relative(0.9, parentSize: size)
        ..collisionType = CollisionType.passive,
    );

    return super.onLoad();
  }

  @override
  void update(double dt) {
    angle += rotationalSpeed;
    position.y += 5;
    if (position.y > gameRef.size.y) {
      removeFromParent();

      gameRef.children.query<ScoreComponent>().first.addScore();
    }
    super.update(dt);
  }
}
