/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsCertificatesGen {
  const $AssetsCertificatesGen();

  /// File path: assets/certificates/certificate_judge.png
  AssetGenImage get certificateJudge =>
      const AssetGenImage('assets/certificates/certificate_judge.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ikmf_games.png
  AssetGenImage get ikmfGames =>
      const AssetGenImage('assets/images/ikmf_games.png');

  /// File path: assets/images/ikmf_kettlebell.png
  AssetGenImage get ikmfKettlebell =>
      const AssetGenImage('assets/images/ikmf_kettlebell.png');

  /// File path: assets/images/ikmf_logo.png
  AssetGenImage get ikmfLogo =>
      const AssetGenImage('assets/images/ikmf_logo.png');

  /// File path: assets/images/ikmf_logo_labels.png
  AssetGenImage get ikmfLogoLabels =>
      const AssetGenImage('assets/images/ikmf_logo_labels.png');

  /// File path: assets/images/ikmf_marathon.png
  AssetGenImage get ikmfMarathon =>
      const AssetGenImage('assets/images/ikmf_marathon.png');

  /// File path: assets/images/ikmf_pentathlon.png
  AssetGenImage get ikmfPentathlon =>
      const AssetGenImage('assets/images/ikmf_pentathlon.png');
}

class Assets {
  Assets._();

  static const $AssetsCertificatesGen certificates = $AssetsCertificatesGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
