import 'dart:html';

import 'package:flutter/foundation.dart';

String path(str) {
  return (kIsWeb) ? 'assets/$str' : str;
}

downloadFile(url) {
  AnchorElement anchorElement = AnchorElement(href: url);
  //anchorElement.download = "Flutter Logo";
  anchorElement.click();
}

String mac_build = "https://faefolk.nyc3.cdn.digitaloceanspaces.com/faefolk.dmg";
String windows_build = "https://faefolk.nyc3.cdn.digitaloceanspaces.com/faefolk.exe";

String getGameLink() {
  if (defaultTargetPlatform == TargetPlatform.macOS) {
    return mac_build;
  } else if (defaultTargetPlatform == TargetPlatform.windows) {
    return windows_build;
  } else {
    return windows_build;
  }
}
