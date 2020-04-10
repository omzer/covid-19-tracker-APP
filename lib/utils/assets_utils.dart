class AssetsUtils {
  static final String _basePath = 'lib';
  static final String _imagesPath = 'imgs';
  static final String _jpg = 'jpg';
  static final String _png = 'png';

  static String getJPGImagePath(fileName) {
    return '$_basePath/$_imagesPath/$fileName.$_jpg';
  }

  static String getPNGImagePath(fileName) {
    return '$_basePath/$_imagesPath/$fileName.$_png';
  }

}
