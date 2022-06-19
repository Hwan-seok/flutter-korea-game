import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_korea_game/space_game.dart';

class ScoreComponent extends HudMarginComponent<SpaceGame> {
  int score = 0;

  ScoreComponent({
    super.margin = const EdgeInsets.only(top: 100, left: 100),
  });

  @override
  Future<void> onLoad() {
    return super.onLoad();
  }

  @override
  void onMount() {
    final textComponent = TextComponent(
      text: "SCORE: $score",
      textRenderer: TextPaint(
        style: Theme.of(gameRef.buildContext!)
            .textTheme
            .headline3!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
    add(textComponent);
    children.register<TextComponent>();
    super.onMount();
  }

  void addScore() {
    score += 100;
    children.query<TextComponent>().first.text = "SCORE: $score";
  }
}
