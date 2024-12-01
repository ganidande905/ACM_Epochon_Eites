// TODO Implement this library.carbonintake

import 'package:flutter/material.dart';

class CarbonIntakePage extends StatefulWidget {
 const CarbonIntakePage({super.key});

 @override
 _CarbonIntakePageState createState() => _CarbonIntakePageState();
}

class _CarbonIntakePageState extends State<CarbonIntakePage> {
 final TextEditingController _airPurityController = TextEditingController();
 final TextEditingController _carbIntakeController = TextEditingController();
 final TextEditingController _waterPurityController = TextEditingController();

 double fitnessScore = 0;

 // Function to calculate the individual score for air purity
 int calculateAirPurityScore(double airPurity) {
   if (airPurity >= 0 && airPurity <= 30) return 30;
   if (airPurity > 30 && airPurity <= 60) return 50;
   if (airPurity > 60 && airPurity <= 90) return 70;
   if (airPurity == 100) return 100;
   return 0;
 }

 // Function to calculate the individual score for water purity
 int calculateWaterPurityScore(double waterPurity) {
   if (waterPurity >= 0 && waterPurity <= 30) return 30;
   if (waterPurity > 30 && waterPurity <= 60) return 50;
   if (waterPurity > 60 && waterPurity <= 90) return 70;
   if (waterPurity == 100) return 100;
   return 0;
 }

 // Function to calculate the individual score for carbohydrate intake
 int calculateCarbIntakeScore(double carbIntake) {
   if (carbIntake >= 10 && carbIntake <= 30) return 100;
   if (carbIntake > 30 && carbIntake <= 60) return 50;
   if (carbIntake > 60 && carbIntake <= 80) return 30;
   if (carbIntake > 80 && carbIntake <= 100) return 0;
   return 0;
 }

 // Function to calculate the final fitness score based on the inputs
 void calculateFitness() {
   double airPurity = double.tryParse(_airPurityController.text) ?? 0;
   double carbIntake = double.tryParse(_carbIntakeController.text) ?? 0;
   double waterPurity = double.tryParse(_waterPurityController.text) ?? 0;

   // Calculate individual scores
   int airPurityScore = calculateAirPurityScore(airPurity);
   int waterPurityScore = calculateWaterPurityScore(waterPurity);
   int carbIntakeScore = calculateCarbIntakeScore(carbIntake);

   // Calculate average score
   double avgScore = (airPurityScore + waterPurityScore + carbIntakeScore) / 3;

   setState(() {
     fitnessScore = avgScore;
   });
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text("Calculate Carbon Intake")),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           // Air Purity Input
           TextField(
             controller: _airPurityController,
             keyboardType: TextInputType.number,
             decoration: const InputDecoration(
               labelText: "Air Purity (%)",
               hintText: "Enter the air purity in percentage",
               border: OutlineInputBorder(),
             ),
           ),
           const SizedBox(height: 15),

           // Carbohydrate Intake Input
           TextField(
             controller: _carbIntakeController,
             keyboardType: TextInputType.number,
             decoration: const InputDecoration(
               labelText: "Carbohydrate Intake (g)",
               hintText: "Enter the amount of carbs you consumed today",
               border: OutlineInputBorder(),
             ),
           ),
           const SizedBox(height: 15),

           // Water Purity Input
           TextField(
             controller: _waterPurityController,
             keyboardType: TextInputType.number,
             decoration: const InputDecoration(
               labelText: "Water Purity (%)",
               hintText: "Enter the purity of your drinking water",
               border: OutlineInputBorder(),
             ),
           ),
           const SizedBox(height: 30),

           // Calculate Button
           ElevatedButton(
             onPressed: calculateFitness,
             style: ElevatedButton.styleFrom(
               padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
               backgroundColor: const Color.fromARGB(165, 255, 253, 253),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30),
               ),
             ),
             child: const Text(
               "Calculate Fitness",
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
           const SizedBox(height: 20),

           // Fitness Score Result
           if (fitnessScore > 0)
             Text(
               "Your Fitness Score: ${fitnessScore.toStringAsFixed(2)}%",
               style: const TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),
             ),
         ],
       ),
     ),
   );
 }
}



