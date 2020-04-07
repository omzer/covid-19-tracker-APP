class AssetsUtils {
  static final String _basePath = 'lib';
  static final String _imagesPath = 'imgs';
  static final String _jpg = 'jpg';

  static String getJPGImagePath(fileName) {
    return '$_basePath/$_imagesPath/$fileName.$_jpg';
  }
}
