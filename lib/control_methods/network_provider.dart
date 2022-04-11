import 'package:json_listing_noida/control_methods/logic_methods.dart';
import 'package:json_listing_noida/main.dart';
import 'package:path/path.dart' as P;
import '../models/icon_model.dart';

class Networkcontroller {
  final ls = {
    "data": [
      {
        "id": 114,
        "title_symbol": "flag.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 4
      },
      {
        "id": 97,
        "title_symbol": "diamond.png",
        "file_id": 101,
        "file_name": "file2.png",
        "actual_count": 1
      },
      {
        "id": 216,
        "title_symbol": "marker.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 3
      },
      {
        "id": 77,
        "title_symbol": "lock.png",
        "file_id": 101,
        "file_name": "file2.png",
        "actual_count": 5
      },
      {
        "id": 24,
        "title_symbol": "light.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 26
      },
      {
        "id": 318,
        "title_symbol": "flag.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 2
      },
      {
        "id": 124,
        "title_symbol": "light.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 20
      },
      {
        "id": 206,
        "title_symbol": "marker.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 18
      },
      {
        "id": 115,
        "title_symbol": "lock.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 5
      },
      {
        "id": 136,
        "title_symbol": "diamond.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 35
      },
      {
        "id": 97,
        "title_symbol": "diamond.png",
        "file_id": 101,
        "file_name": "file2.png",
        "actual_count": 9
      },
      {
        "id": 701,
        "title_symbol": "rocket.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 3
      },
      {
        "id": 4,
        "title_symbol": "flag.png",
        "file_id": 101,
        "file_name": "file2.png",
        "actual_count": 8
      },
      {
        "id": 183,
        "title_symbol": "marker.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 5
      },
      {
        "id": 197,
        "title_symbol": "diamond.png",
        "file_id": 101,
        "file_name": "file2.png",
        "actual_count": 17
      },
      {
        "id": 98,
        "title_symbol": "marker.png",
        "file_id": 101,
        "file_name": "file2.png",
        "actual_count": 3
      },
      {
        "id": 55,
        "title_symbol": "light.png",
        "file_id": 101,
        "file_name": "file2.png",
        "actual_count": 90
      },
      {
        "id": 88,
        "title_symbol": "rocket.png",
        "file_id": 101,
        "file_name": "file2.png",
        "actual_count": 1
      },
      {
        "id": 304,
        "title_symbol": "rocket.png",
        "file_id": 100,
        "file_name": "file1.png",
        "actual_count": 1
      }
    ]
  };

  List<IconModel> convertToModel() {
    List<IconModel> iconList = [];
    final data = ls['data'];
    data!.forEach((element) {
      iconList.add(IconModel.fromMap(element));
    });
    return iconList;
  }

//
//
//
  List<String> extractAllFiles() {
    List<IconModel> iconList = convertToModel();
    final data = ls['data'];
    final files = logicC.convertToFilesList(iconList, convertType.file);
    return files;
  }

  //
  //
  //
  List<String> fetchIconData(String iconName) {
    List<String> mapData = [];
    mapData.add(iconName.replaceAll(RegExp(r'.png'), ''));
    int total = 0;
    final allfiles = extractAllFiles();
    allfiles.forEach((file) {
      print("1@11 ${file}");
      int num = logicC.numberOfIcons(convertToModel(), iconName, file);
      mapData.add(num.toString());
      total = total + num;
    });

    mapData.add(total.toString());
    fetchAllIcons();
    return mapData;
  }

  //
  //
  //
  List<String> fetchAllIcons() {
    final iconList = convertToModel();
    final files = logicC.convertToFilesList(iconList, convertType.Icon);
    print(files.toString());
    return files;
  }
  //
  //
  //
  // returnIconList() {
  //   return iconList;
  // }
}
