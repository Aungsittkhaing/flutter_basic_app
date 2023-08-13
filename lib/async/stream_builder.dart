import 'package:flutter/material.dart';
class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  int timeValue = 0;
  bool paused = true;

  final Stream<int> periodicStream = Stream.periodic(const Duration(milliseconds: 1000), (i)=>i);
  int previousStreamValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: periodicStream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            if(snapshot.hasData){
              if(snapshot.data != previousStreamValue){
                print('Latest snapshot from stream: ${snapshot.data}');
                if(!paused){
                  timeValue++;
                }
              }
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('StreamBuilder can listen to a stream, and update UI'),
                Card(
                  child: Column(
                    children: [
                      Text('$timeValue', style: Theme.of(context).textTheme.headlineMedium,),
                      ButtonBar(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  paused = !paused;
                                });
                              },
                              icon: Icon(paused ? Icons.play_arrow_outlined : Icons.pause_outlined)
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              timeValue = 0;
                              paused = true;
                            });
                          },
                              icon: const Icon(Icons.stop_outlined)
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
