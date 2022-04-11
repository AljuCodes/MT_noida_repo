import '../models/icon_model.dart';
enum convertType{
  file,
  Icon
}
class LogicMethods {
  List<Map<String, dynamic>> iconList = [];
  List<String> convertToFilesList(List<IconModel> ls , convertType type) {
    List<String> fileNames = [];
    ls.forEach((element) {
      if(type == convertType.file){
        
      fileNames.add(element.file_name);
    }else{
      fileNames.add(element.title_symbol);
    }
    });
    final fileNamesUniqe = fileNames.toSet().toList();
    print(fileNamesUniqe.toString());
    return fileNamesUniqe;
  }

  numberOfIcons(List<IconModel> ls, String iconName, String fileName) {
    int numberOfIcons = 0;
    List<IconModel> theList = ls
        .where((element) => element.file_name == fileName)
        .where((element) => element.title_symbol == iconName)
        .toList();
    print("1@11 ${theList.length}");
    theList.forEach((element) {
      numberOfIcons += element.actual_count;
    });

    return numberOfIcons;
  }
}
