import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter_korea_game/component/meteor_component.dart';
import 'package:flutter_korea_game/gen/assets.gen.dart';
import 'package:flutter_korea_game/space_game.dart';

enum ShipMovement {
  idle,
  left,
  right,
  damaged,
}

extension LogicalKeyboardKeyHelper on LogicalKeyboardKey {
  bool get isLeft =>
      this == LogicalKeyboardKey.keyA || this == LogicalKeyboardKey.arrowLeft;
  bool get isRight =>
      this == LogicalKeyboardKey.keyD || this == LogicalKeyboardKey.arrowRight;
}

class ShipComponent extends SpriteGroupComponent<ShipMovement>
    with CollisionCallbacks, KeyboardHandler, HasGameRef<SpaceGame> {
  static const speed = 5;

  ShipComponent({
    super.priority,
    super.anchor = Anchor.center,
  });

  @override
  Future<void>? onLoad() {
    size = Vector2(99, 75);
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 150);
    add(RectangleHitbox());

    sprites = {
      ShipMovement.idle:
          Sprite(gameRef.images.fromCache(Assets.images.player.path)),
      ShipMovement.left:
          Sprite(gameRef.images.fromCache(Assets.images.playerLeft.path)),
      ShipMovement.right:
          Sprite(gameRef.images.fromCache(Assets.images.playerRight.path)),
      ShipMovement.damaged:
          Sprite(gameRef.images.fromCache(Assets.images.playerDamaged.path)),
    };
    current = ShipMovement.idle;
    addKeyboardEvents();
    return super.onLoad();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is MeteorComponent) {
      current = ShipMovement.damaged;
      gameRef.gameOver();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  void addKeyboardEvents() {
    add(
      KeyboardListenerComponent(
        keyUp: {
          LogicalKeyboardKey.keyA: handleKeyPressed,
          LogicalKeyboardKey.keyD: handleKeyPressed,
          LogicalKeyboardKey.arrowRight: handleKeyPressed,
          LogicalKeyboardKey.arrowLeft: handleKeyPressed,
        },
        keyDown: {
          LogicalKeyboardKey.keyA: handleKeyPressed,
          LogicalKeyboardKey.keyD: handleKeyPressed,
          LogicalKeyboardKey.arrowRight: handleKeyPressed,
          LogicalKeyboardKey.arrowLeft: handleKeyPressed,
        },
      ),
    );
  }

  bool handleKeyPressed(Set<LogicalKeyboardKey> pressedKeys) {
    if (pressedKeys.isEmpty) {
      current = ShipMovement.idle;
    } else if (pressedKeys.last.isLeft) {
      current = ShipMovement.left;
    } else if (pressedKeys.last.isRight) {
      current = ShipMovement.right;
    }
    return true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (current == ShipMovement.left) {
      if (position.x < 0) return;
      position.x -= speed;
    } else if (current == ShipMovement.right) {
      if (position.x > gameRef.size.x) return;
      position.x += speed;
    }
  }
}
