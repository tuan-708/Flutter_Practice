import 'package:flutter/material.dart';
import 'package:flutter_application_2/hepler_function.dart';
import 'package:flutter_application_2/hurlde_provider.dart';
import 'package:flutter_application_2/wordle_view.dart';
import 'package:provider/provider.dart';
import 'keyboard_view.dart';

class WordHurdlePage extends StatefulWidget {
  const WordHurdlePage({super.key});

  @override
  State<WordHurdlePage> createState() => _WordHurdlePageState();
}

class _WordHurdlePageState extends State<WordHurdlePage> {
  @override
  void didChangeDependencies() {
    Provider.of<HurdleProvider>(context, listen: false).init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Hurdle'),
      ),
      body: Center(
        child: Column(children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Consumer<HurdleProvider>(
                builder: (context, provider, child) => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4),
                    itemCount: provider.HurdleBoard.length,
                    itemBuilder: ((context, index) {
                      final wordle = provider.HurdleBoard[index];
                      return WordleView(wordle: wordle);
                    })),
              ),
            ),
          ),
          Consumer<HurdleProvider>(
            builder: (context, provider, child) => KeyboardView(
              excludedLetter: provider.excludedLetters,
              onPressed: (value) {
                provider.inputLetter(value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Consumer<HurdleProvider>(
                builder: (context, provider, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              provider.deleteLetter();
                            },
                            child: Text('DELETE')),
                        ElevatedButton(
                            onPressed: () {
                              // if(!provider.isAvalidWord){
                              //   showMsg(context, 'Not a word in my dictionary.');
                              //   return;
                              // }
                              if (provider.shouldCheckForAnswer) {
                                provider.checkAnswer();
                              }

                              if (provider.wins) {
                                showResult(
                                    context: context,
                                    title: 'You Win!!!',
                                    body: 'The word was ${provider.targetWord}',
                                    conPlayAgain: () {
                                      Navigator.pop(context);
                                      provider.reset();
                                    },
                                    onCancel: () {
                                      Navigator.pop(context);
                                    });
                              } else if (provider.noAttemptsLeft) {
                                showResult(
                                    context: context,
                                    title: 'You Lost!!!',
                                    body: 'The word was ${provider.targetWord}',
                                    conPlayAgain: () {
                                      Navigator.pop(context);
                                      provider.reset();
                                    },
                                    onCancel: () {
                                      Navigator.pop(context);
                                    });
                              }
                            },
                            child: Text('SUBMIT')),
                      ],
                    )),
          )
        ]),
      ),
    );
  }
}
