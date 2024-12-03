import 'package:flutter/material.dart';
import 'package:translator_plus/translator_plus.dart';

class translatorPage extends StatefulWidget {
  const translatorPage({super.key});

  @override
  State<translatorPage> createState() => _translatorPageState();
}

class _translatorPageState extends State<translatorPage> {
  // List<String> Languages = ['English', 'Hebrew', 'Spanish','French','German','Italian','Portuguese'];
  List<String> Languages = [
    'English',
    'Spanish',
    'Hebrew',
    'French',
    'German',
    'Italian',
    'Portuguese',
    'Russian',
    'Chinese',
    'Japanese',
    'Arabic',
    'Korean',
    'Hindi',
    'Dutch',
    'Turkish',
    'Swedish',
    'Danish',
    'Norwegian',
    'Finnish',
    'Greek',
    'Polish',
    'Czech',
    'Hungarian',
    'Romanian',
    'Thai',
    'Vietnamese',
    'Indonesian',
    'Bengali',
  ];

  String output_translator = '';
  String input = 'From';
  String out = 'To';
  TextEditingController controller = TextEditingController();

  void translator() async {
    String getInputLang = getLanguage(input);
    String getOutLang = getLanguage(out);
    String getTextInput = controller.text.toString();

    if (getInputLang == '--' || getOutLang == '--') {
      setState(() {
        output_translator = 'you didn\'t chooise lang';
      });
      return;
    }
    if (getTextInput.isEmpty) {
      setState(() {
        output_translator = 'please enter text to translate';
      });
    }
    try {
      print("Starting hardcoded translation...");
      GoogleTranslator translate = GoogleTranslator();

      // Perform the translation with hardcoded values
      var translation = await translate.translate(getTextInput,
          from: getInputLang, to: getOutLang);
      setState(() {
        output_translator = translation.text;
      });
      // Print the result of the translation
      print("Hardcoded translation: ${translation.text}");
    } catch (e) {
      // Handle and print any errors that occur during translation
      print("Error during hardcoded translation: $e");
    }
  }

  // String getLanguage(String Language) {
  //   if (Language == 'English') {
  //     return 'en';
  //   } else if (Language == 'Spanish') {
  //     return 'es';
  //   }
  //   return '--';
  // }
  String getLanguage(String Language) {
    if (Language == 'English') {
      return 'en';
    } else if (Language == 'Spanish') {
      return 'es';
    } else if (Language == 'Hebrew') {
      return 'he';
    } else if (Language == 'French') {
      return 'fr';
    } else if (Language == 'German') {
      return 'de';
    } else if (Language == 'Italian') {
      return 'it';
    } else if (Language == 'Portuguese') {
      return 'pt';
    } else if (Language == 'Russian') {
      return 'ru';
    } else if (Language == 'Chinese') {
      return 'zh';
    } else if (Language == 'Japanese') {
      return 'ja';
    } else if (Language == 'Arabic') {
      return 'ar';
    } else if (Language == 'Korean') {
      return 'ko';
    } else if (Language == 'Hindi') {
      return 'hi';
    } else if (Language == 'Dutch') {
      return 'nl';
    } else if (Language == 'Turkish') {
      return 'tr';
    } else if (Language == 'Swedish') {
      return 'sv';
    } else if (Language == 'Danish') {
      return 'da';
    } else if (Language == 'Norwegian') {
      return 'no';
    } else if (Language == 'Finnish') {
      return 'fi';
    } else if (Language == 'Greek') {
      return 'el';
    } else if (Language == 'Polish') {
      return 'pl';
    } else if (Language == 'Czech') {
      return 'cs';
    } else if (Language == 'Hungarian') {
      return 'hu';
    } else if (Language == 'Romanian') {
      return 'ro';
    } else if (Language == 'Thai') {
      return 'th';
    } else if (Language == 'Vietnamese') {
      return 'vi';
    } else if (Language == 'Indonesian') {
      return 'id';
    } else if (Language == 'Bengali') {
      return 'bn';
    }
    return '--'; // Default return if no match found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
          title: Text('Translator Page'),
          centerTitle: true,
          backgroundColor: Colors.pink.shade300),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                DropdownButton(
                    hint: Text(input),
                    dropdownColor: Colors.pink.shade50,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: Languages.map((String dropString) {
                      return DropdownMenuItem(
                        child: Text(dropString),
                        value: dropString,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        input = value!;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton(
                    hint: Text(out),
                    dropdownColor: Colors.pink.shade50,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: Languages.map((String dropString) {
                      return DropdownMenuItem(
                        child: Text(dropString),
                        value: dropString,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        out = value!;
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                style: TextStyle(color: Colors.white,fontSize: 20),
                decoration: InputDecoration(
                    labelText: 'please enter the text to translate',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 5),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15)),
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter again the text to translate';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade300),
                  onPressed: () {
                    translator();
                  },
                  child: Text('Translate')),
            ),
            SizedBox(
              height: 20,
            ),
            Text("\n$output_translator",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
