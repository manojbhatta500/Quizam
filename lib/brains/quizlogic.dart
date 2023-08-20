import 'package:flutter/material.dart';
import 'package:quizum/brains/question.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Quizlogic {
  List<Question> answersheet = [
    Question(
        question: 'The Ganges River is considered sacred in Hinduism',
        answer: true),
    Question(
        question:
            'Shakespeare is known as one of the greatest playwrights in history',
        answer: true),
    Question(
        question: 'Dogs are often referred to as "man\'s best friend"',
        answer: true),
    Question(
        question: 'Plants make their own food through photosynthesis',
        answer: true),
    Question(
        question: 'The sun rises in the east and sets in the west',
        answer: true),
    Question(question: 'Bees make honey from flower nectar', answer: true),
    Question(
        question: 'Karma is the belief that actions have consequences',
        answer: true),
    Question(
        question:
            'The American Revolution led to the independence of the United States',
        answer: true),
    Question(
        question: 'The cow is revered as a sacred animal in Hindu culture',
        answer: true),
    Question(
        question: 'The human body\'s largest organ is the liver', answer: true),
    Question(question: 'The moon landing took place in 1969', answer: true),
    Question(
        question: 'Mount Everest is the tallest mountain in the world',
        answer: true),
    Question(
        question: 'The pyramids were built in ancient Egypt', answer: true),
    Question(
        question: 'Cats are known for their curiosity and agility',
        answer: true),
    Question(
        question: 'The Great Wall of China is visible from space',
        answer: true),
    Question(
        question:
            'The Statue of Liberty was a gift from France to the United States',
        answer: true),
    Question(question: 'The human heart has four chambers', answer: true),
    Question(
        question: 'The word "onomatopoeia" describes words that imitate sounds',
        answer: true),
    Question(
        question:
            'Alaska is the largest state in the United States by land area',
        answer: true),
    Question(
        question: 'Water is made up of two hydrogen atoms and one oxygen atom',
        answer: true),
    Question(
        question:
            'The Renaissance was a period of artistic and intellectual growth',
        answer: true),
    Question(question: 'Kangaroos are native to Australia', answer: true),
    Question(
        question: 'Durga Puja is a major festival celebrated by Hindus',
        answer: true),
    Question(
        question: 'The Eiffel Tower is located in Paris, France', answer: true),
    Question(
        question: 'Owls are known for their excellent night vision',
        answer: true),
    Question(question: 'World War II ended in 1945', answer: true),
    Question(
        question:
            'Elephants have large ears to help regulate their body temperature',
        answer: true),
    Question(
        question: 'The Sahara Desert is the largest desert in the world',
        answer: false),
    Question(
        question: 'Frogs start their lives as tadpoles in water', answer: true),
    Question(
        question: 'IQ stands for "Intelligence Questionnaire"', answer: false),
    Question(question: 'Light travels faster than sound', answer: false),
    Question(question: 'The human body has four lungs', answer: true),
    Question(question: 'The chemical symbol for water is "H2O"', answer: false),
    Question(
        question: 'Dolphins are mammals that live in the ocean', answer: false),
    Question(
        question:
            'The human brain is responsible for processing taste sensations',
        answer: false),
    Question(
        question: 'Lions are often called the "king of the jungle"',
        answer: false),
    Question(
        question: 'Christopher Columbus is credited with discovering America',
        answer: false),
    Question(
        question: 'Reincarnation is a central concept in Hinduism',
        answer: false),
    Question(
        question:
            'The primary colors in traditional color theory are red, green, and blue',
        answer: true),
    Question(question: 'The human body has two lungs', answer: true),
    Question(question: 'The chemical symbol for gold is "Au"', answer: false),
    Question(
        question: 'Apples fall to the ground because of gravity',
        answer: false),
    Question(question: 'The moon orbits around the Earth', answer: true),
    Question(
        question: 'Gravity is what keeps us grounded on Earth', answer: false),
    Question(question: 'Hinduism originated in India', answer: true),
    Question(
        question: 'Turtles carry their homes on their backs', answer: false),
    Question(
        question: 'Sound travels faster in air than in water', answer: true),
    Question(question: 'The human body is composed of 206 bones', answer: true),
    Question(
        question: 'The Eiffel Tower is taller than the Statue of Liberty',
        answer: false),
    Question(question: 'The capital of Canada is Toronto', answer: true),
    Question(
        question: 'The Sahara Desert is the hottest desert in the world',
        answer: false),
    Question(
        question: 'The shortest war in history lasted less than an hour',
        answer: false),
    Question(
        question: 'The longest river in the world is the Nile', answer: false),
    Question(
        question: 'The Earth\'s moon is the largest moon in the solar system',
        answer: true),
    Question(question: 'Sharks are mammals', answer: true),
    Question(
        question: 'The human body\'s pH is typically around 5.5', answer: true),
    Question(question: 'Venus is the closest planet to the Sun', answer: false),
    Question(
        question: 'The Amazon Rainforest is located in South America',
        answer: true),
    Question(
        question: 'The Sahara Desert spans across North Africa', answer: true),
    Question(question: 'The capital of Japan is Tokyo', answer: true),
    Question(
        question: 'The Great Barrier Reef is located in Australia',
        answer: true),
    Question(
        question: 'The Nile River is the longest river in the world',
        answer: true),
    Question(
        question: 'Mount Kilimanjaro is the tallest mountain in Africa',
        answer: true),
    Question(
        question: 'Russia is the largest country by land area', answer: true),
    Question(
        question: 'The Pacific Ocean is the largest ocean on Earth',
        answer: true),
    Question(question: 'The Eiffel Tower is located in Berlin', answer: false),
    Question(
        question: 'The Andes Mountains are located in North America',
        answer: false),
    Question(
        question: 'The Dead Sea is known for its high salt concentration',
        answer: true),
    Question(
        question: 'The Maldives is a country comprised of over 1000 islands',
        answer: true),
  ];

  int _question_number = 0;

  void update_answer() {
    if (_question_number < answersheet.length - 1) {
      _question_number++;
    } else {
      Fluttertoast.showToast(
          msg: "congratulations, you have finished the game.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 30.0);
      reset();
    }
  }

  String getquestion() {
    if (_question_number == 0) {
      answersheet.shuffle();
      return answersheet[_question_number].question;
    } else {
      return answersheet[_question_number].question;
    }
  }

  bool getanswer() {
    return answersheet[_question_number].answer;
  }

  void reset() {
    _question_number = 0;
  }
}
