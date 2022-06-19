import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_korea_game/space_game.dart';

class MadeByComponent extends HudMarginComponent<SpaceGame> {
  MadeByComponent({
    super.margin = const EdgeInsets.only(top: 40, right: 300),
  });

  @override
  void onMount() {
    final textComponent = TextComponent(
      text: "Very Simple Space Game\nMade by Hwanseok kang",
      textRenderer: TextPaint(
        style: Theme.of(gameRef.buildContext!)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
    add(textComponent);
    super.onMount();
  }
}
