library open_filex;

export 'src/common/open_result.dart';
export 'src/platform/open_filex.dart'
    if (dart.library.html) 'src/web/open_filex.dart';
