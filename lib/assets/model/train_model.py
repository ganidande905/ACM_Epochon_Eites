import tensorflow as tf
import numpy as np

# Example data: transport, energy, diet, lifestyle
# [distance_km, transport_mode, electricity_kWh, meat_days, recycling, water_usage]
# transport_mode: 0=car, 1=bike, 2=public transport
# recycling: 0=no, 1=yes
data = np.array([
    [10, 0, 150, 7, 0, 100],  
    [15, 1, 100, 4, 1, 120],  
    [5, 2, 50, 0, 1, 80],     
    [20, 0, 200, 6, 0, 150],    
    [30, 1, 180, 3, 1, 110],  
    [2, 2, 40, 0, 1, 70],     
    [25, 0, 250, 5, 0, 200],  
])

#carbon emissions in kg CO2
labels = np.array([12.5, 8.0, 2.5, 15.0, 10.0, 1.5, 18.0])


model = tf.keras.Sequential([
    tf.keras.layers.Dense(128, activation='relu', input_shape=(6,)),  # 6 input features
    tf.keras.layers.Dense(64, activation='relu'),
    tf.keras.layers.Dense(32, activation='relu'),
    tf.keras.layers.Dense(1)  # Output: predicted carbon emissions
])

# Compile
model.compile(optimizer='adam', loss='mse', metrics=['mae'])

# Train
model.fit(data, labels, epochs=100, batch_size=4)

# Save
model.save('carbonx_model.h5')

# Convert to TensorFlow Lite
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()

with open('carbonx_model.tflite', 'wb') as f:
    f.write(tflite_model)

print("Model saved successfully!")
