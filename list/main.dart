void main() {
  // 1. 단일 타입 생성
  List<int> li = [11,22,33];
  
  // 1-2. 다양한 타입 생성 2
  List li2 = [1,2, "삼",{"key":"value"}, [false, false], 0];
  
  print(li2);

  // 2. 특정 요소 출력
  print(li[0]);
  print(li[2]);
  
  // 3. 요소 변경
  li[1] = 22;
  
  // 4. 요소 추가
  li.add(1);
  li.add(2);
  li.add(3);
  li.add(4);
  li.add(5);
  
//   // 5. 요소 삭제
  li.remove(1);
  li.removeAt(0);
  
  // 6. 요소 총 개수
  print(li.length);
  
  // 7. 순번 출력
  print(li.indexOf(1));
  print(li.indexOf(111)); // 존재하지 않는 경우 
  
  // 8. for문 응용
  // 출력
  for(int i = 0; i < li.length; i++){
    print(li[i]);
  }
  
  // 9-1. map
  List<int> lii = li.map((e) => e+1).toList();
  print(lii);
  
  // 9-2. forEach
  lii.forEach((e) => print(e));
  
  // 10. 형변환 List -> Set -> List
  Set<int> liSet = new Set.of(lii);
  List<int> liSetLi = liSet.toList();
  print(liSetLi);
  
  // 11. List<int> -> List<Map<String, int>>
  List<Map<String, int>> liInMap = liSetLi.map<Map<String, int>>((e) => {"key" : e}).toList();
  print(liInMap);
  
  // 11.*응용
  List<MyClass> liMy = liInMap.map<MyClass>((e) => new MyClass(value:e['key'])).toList();
  print(liMy);
  
  List<MyClass2> liMy2 = liInMap.map<MyClass2>((Map<String, int> e) => MyClass2.worker(e:e['key'])).toList();
  print(liMy2);
  
  List<MyClass2> liMy3 = liMy.map<MyClass2>((MyClass e) => MyClass2.worker(e:e.value)).toList();
  
  print(liMy3);
}

class MyClass{
  int value;
  MyClass({this.value});
}

class MyClass2{
  int value;
  MyClass2({this.value});
  factory MyClass2.worker({int e}) => new MyClass2(value:e);
}
