import 'package:flutter/material.dart';
void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Example title'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: const Center(
        child: Counter(),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}


//지금까지 이 페이지에서는 Stateless Widget만 사용했습니다.StatelessWidget은 상위 위젯으로부터 인수를 받습니다.
//최종 멤버 변수에 저장됩니다. 위젯에 build()가 요청되면 위젯은 저장된 값을 사용하여 생성된 위젯에 대한 새 인수를 파생합니다.
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //GestureDetector 위젯은 시각적 표현이 없지만 대신 사용자가 만든 제스처를 감지합니다.
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

//StatefulWidget과 State가 왜 별도의 객체인지 궁금할 것입니다. Flutter에서 이 두 가지 유형의 객체는 서로 다른 수명 주기를 갖습니다.
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }
  // Widget은 현재 상태에서 애플리케이션의 프리젠테이션을 구성하는 데 사용되는 임시 객체입니다.
  // 반면에 State 개체는 build() 호출 간에 지속되므로 정보를 기억할 수 있습니다.
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter'),
      ],
    );
  }
}
