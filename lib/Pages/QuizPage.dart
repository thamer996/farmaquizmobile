import 'package:flutter/material.dart';
import 'quiz_result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _quizData = [
    {
      'question': 'What is the largest organ in the human body?',
      'options': ['Heart', 'Liver', 'Skin', 'Brain'],
      'correctAnswer': 'Skin',
      'additionalInfo': 'The human skin, consisting of the epidermis, dermis, and hypodermis, serves as a protective barrier against the environment, regulates temperature, and senses touch. It features hair, nails, and glands for various functions, while melanin provides pigmentation and some UV protection. Skin conditions and aging are common concerns, emphasizing the importance of skincare and professional advice.'
    },
    {
      'question': 'Which vitamin is known as the "sunshine vitamin"?',
      'options': ['Vitamin A', 'Vitamin C', 'Vitamin D', 'Vitamin E'],
      'correctAnswer': 'Vitamin D',
      'additionalInfo': 'Vitamin D is not just a vitamin, but a prohormone that affects many organs and functions in the body, from bones to muscles to immunity.'

    },
    {
      'question': 'Which of the following is a condition characterized by high blood sugar?',
      'options': ['Hypertension', 'Hypoglycemia', 'Diabetes', 'Anemia'],
      'correctAnswer': 'Diabetes',
      'additionalInfo': 'Diabetes mellitus refers to a group of diseases that affect how the body uses blood sugar (glucose). Glucose is an important source of energy for the cells that make up the muscles and tissues. It \'s also the brain\'s main source of fuel. The main cause of diabetes varies by type. '
    },
    {
      'question': 'What is the medical term for inflammation of the joints?',
      'options': ['Arthritis', 'Osteoporosis', 'Scoliosis', 'Fibromyalgia'],
      'correctAnswer': 'Arthritis',
      'additionalInfo': 'Arthritis is a term encompassing various inflammatory joint disorders causing pain, swelling, and reduced mobility. Osteoarthritis (wear-and-tear) and rheumatoid arthritis (autoimmune) are common types. Inflammation damages joint cartilage and surrounding tissues, leading to discomfort and stiffness. Treatments include medications, physical therapy, lifestyle adjustments, and, in severe cases, surgery. Early diagnosis and management are crucial for minimizing symptoms and maintaining joint function.'
    },
    {
      'question': 'Which organ produces insulin in the human body?',
      'options': ['Liver', 'Pancreas', 'Kidney', 'Stomach'],
      'correctAnswer': 'Pancreas',
      'additionalInfo': 'A glandular organ located in the abdomen. It makes pancreatic juices, which contain enzymes that aid in digestion, and it produces several hormones, including insulin. The pancreas is surrounded by the stomach, intestines, and other organs.'
    },

  ];

  String? _userAnswer;
  bool _showResult = false;

  void _showQuestionInfo(String selectedOption) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        final correctAnswer = _quizData[_currentQuestionIndex]['correctAnswer'];
        final additionalInfo = _quizData[_currentQuestionIndex]['additionalInfo'];

        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5, // You can adjust this value as needed
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Question:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _quizData[_currentQuestionIndex]['question'],
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Options:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _quizData[_currentQuestionIndex]['options']
                          .map<Widget>(
                            (option) => Text(
                          option == correctAnswer
                              ? '* $option (Correct Answer)'
                              : '- $option',
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      selectedOption == correctAnswer
                          ? 'Correct!'
                          : 'Incorrect!',
                      style: TextStyle(
                        fontSize: 18,
                        color: selectedOption == correctAnswer
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    if (selectedOption == correctAnswer && additionalInfo != null)
                      const SizedBox(height: 20),
                    Text(
                      additionalInfo,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }





  void _checkAnswer(String selectedOption) {
    if (!_showResult) {
      _showQuestionInfo(selectedOption);
      setState(() {
        if (_quizData[_currentQuestionIndex]['correctAnswer'] == selectedOption) {
          _score++;
          _userAnswer = selectedOption;
        } else {
          _userAnswer = selectedOption;
        }
        _showResult = true;
      });
    }
  }


  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex + 1 < _quizData.length) {
        _currentQuestionIndex++;
        _userAnswer = null;
        _showResult = false;
      } else {
        // Quiz completed, navigate to the result screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultScreen(score: _score, totalQuestions: _quizData.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03919B),
        title: Text('Quiz ${_currentQuestionIndex + 1}/${_quizData.length}'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: _showResult
                      ? Text(
                    _userAnswer == _quizData[_currentQuestionIndex]['correctAnswer']
                        ? 'Bien joué!'
                        : 'Incorrect!',
                    style: TextStyle(
                        color: _userAnswer == _quizData[_currentQuestionIndex]['correctAnswer']
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  )
                      : Text(
                    _quizData[_currentQuestionIndex]['question'],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  _quizData[_currentQuestionIndex]['options'].length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () =>
                          _checkAnswer(_quizData[_currentQuestionIndex]['options'][index]),
                      style: ElevatedButton.styleFrom(
                        primary: _userAnswer ==
                            _quizData[_currentQuestionIndex]['options'][index]
                            ? (_quizData[_currentQuestionIndex]['options'][index] ==
                            _quizData[_currentQuestionIndex]['correctAnswer']
                            ? Colors.green
                            : Colors.red)
                            : Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                      ),
                      child: Text(_quizData[_currentQuestionIndex]['options'][index],
                          style: const TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _userAnswer == null ? _nextQuestion : () => _nextQuestion(),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 2,
              ),
              child: Text(_userAnswer == null ? 'Passer' : 'Suivant'),
            ),
          ],
        ),
      ),
    );
  }
}