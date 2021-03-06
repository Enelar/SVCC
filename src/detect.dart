import 'dart:io';

Stream<String> findFiles(String dir)
{
  return ConvertToStream(dir);
}

Stream<String> ConvertToStream(String dir)
{
  var f = find(dir);
  var ret = new StreamController<String>();

  f.then((result) async
  {
    for (var file in result.stdout.split('\n'))
      ret.add(file);
    ret.close();
  });

  return ret.stream;
}

Future find(String dir) async
{
  return Process.run('find', ['-type', 'f'], workingDirectory: dir);
}
