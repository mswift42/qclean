import 'package:qclean/src/rooms/bed.dart';
import 'package:qclean/src/rooms/private.dart';

import 'dorm.dart';

List<Dorm> sampleDormlist = [
  const Dorm(16, [Bed('a'), Bed('b')]),
  const Dorm(1, [Bed('a'), Bed('b'), Bed('c'), Bed('d')]),
  const Dorm(2, [Bed('a'), Bed('b'), Bed('c'), Bed('d')]),
];

List<Private> samplePrivatelist = [
  const Private(1),
  const Private(2),
  const Private(3),
  const Private(4)
];
