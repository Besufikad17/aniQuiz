import 'dart:convert';
import 'dart:io';

Future<List<dynamic>> readJsonFile(String filePath) async {
  var input = await File(filePath).readAsString();
  var map = jsonDecode(input);
  print(map['questions'].runtimeType);
  return map['questions'];
}

Future<void> main() async {
  var qs = await readJsonFile('assets/data.json');
  print(qs);
}