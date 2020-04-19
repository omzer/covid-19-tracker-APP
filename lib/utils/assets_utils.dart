class AssetsUtils {
  final String _basePath = 'lib';
  final String _imagesPath = 'imgs';
  final String _jpg = 'jpg';
  final String _png = 'png';
  static AssetsUtils _assetsUtils;

  static getInstance() {
    return _assetsUtils ?? (_assetsUtils = AssetsUtils());
  }

  String getJPGImagePath(fileName) {
    return '$_basePath/$_imagesPath/$fileName.$_jpg';
  }

  String getPNGImagePath(fileName) {
    return '$_basePath/$_imagesPath/$fileName.$_png';
  }
}
