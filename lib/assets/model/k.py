from flask import Flask, request, jsonify
import tensorflow as tf
import numpy as np

app = Flask(__name__)

# Load TensorFlow Lite model
interpreter = tf.lite.Interpreter(model_path="lib/assets/carbonx_model.tflite")
interpreter.allocate_tensors()

# Get input/output details
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

#  emission factors for different activities
emission_factors = {
    "transportation": {
        "car": 0.25,
        "bike": 0.05,
        "walk": 0,
        "bus": 0.1,
        "train": 0.2
    },
    "electricity": 0.85,  # kgCO2_per_kWh
    "gas": 1.0,  # kgCO2_per_m3
    "water": 0.3,  # kgCO2_per_liter
    "food": {
        "beef": 27.0,  # kgCO2_per_kg
        "chicken": 6.9,  # kgCO2_per_kg
        "vegetables": 1.5  # kgCO2_per_kg
    }
}

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    
    
    required_fields = ['distance_km', 'transport_mode', 'electricity_kWh', 
                       'meat_days', 'recycling', 'water_usage']
    
    for field in required_fields:
        if field not in data:
            return jsonify({"error": f"Missing required field: {field}"}), 400

  
    distance_km = data['distance_km']
    transport_mode = data['transport_mode']
    electricity_kWh = data['electricity_kWh']
    meat_days = data['meat_days']
    recycling = data['recycling']
    water_usage = data['water_usage']

   
    transportation_emission = distance_km * emission_factors["transportation"].get(transport_mode, 0)
    electricity_emission = electricity_kWh * emission_factors["electricity"]
    water_emission = water_usage * emission_factors["water"]

  
    food_emission = 0
    if meat_days > 0:
        
        food_emission = meat_days * emission_factors["food"]["beef"]


    inputs = np.array([[distance_km, transport_mode, electricity_kWh, 
                        meat_days, recycling, water_usage]], dtype=np.float32)


    interpreter.set_tensor(input_details[0]['index'], inputs)

    interpreter.invoke()


    output = interpreter.get_tensor(output_details[0]['index'])


    total_emission = transportation_emission + electricity_emission + water_emission + food_emission
    response = {
        "emission": float(output[0]),  
        "total_emission": total_emission,
        "suggestions": [
            "Reduce meat consumption to 3 days/week.",
            "Use public transport for short distances.",
            "Install solar panels to reduce electricity usage."
        ],
        "emission_breakdown": {
            "transportation": transportation_emission,
            "electricity": electricity_emission,
            "water": water_emission,
            "food": food_emission,
            "recycling": recycling * 0.1 
        }
    }

    return jsonify(response)

if __name__ == "__main__":
    app.run(debug=True)
