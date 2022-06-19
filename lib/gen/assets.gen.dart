/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/laser.png
  AssetGenImage get laser => const AssetGenImage('assets/images/laser.png');

  /// File path: assets/images/meteor.png
  AssetGenImage get meteor => const AssetGenImage('assets/images/meteor.png');

  /// File path: assets/images/player.png
  AssetGenImage get player => const AssetGenImage('assets/images/player.png');

  /// File path: assets/images/player_damaged.png
  AssetGenImage get playerDamaged =>
      const AssetGenImage('assets/images/player_damaged.png');

  /// File path: assets/images/player_left.png
  AssetGenImage get playerLeft =>
      const AssetGenImage('assets/images/player_left.png');

  /// File path: assets/images/player_right.png
  AssetGenImage get playerRight =>
      const AssetGenImage('assets/images/player_right.png');

  /// File path: assets/images/robot.png
  AssetGenImage get robot => const AssetGenImage('assets/images/robot.png');

  /// File path: assets/images/ufo.png
  AssetGenImage get ufo => const AssetGenImage('assets/images/ufo.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
