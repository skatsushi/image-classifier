import tensorflow as tf
import tensorflow_hub as hub

model_url = "https://tfhub.dev/google/imagenet/mobilenet_v2_100_224/classification/4"
model = tf.keras.Sequential([
    hub.KerasLayer(model_url)
])

def classify_image(image_path):
    img = tf.keras.preprocessing.image.load_img(image_path, target_size=(224, 224))
    img_array = tf.keras.preprocessing.image.img_to_array(img)
    img_array = tf.expand_dims(img_array, 0) 

    predictions = model.predict(img_array)
    top_prediction = tf.keras.applications.mobilenet_v2.decode_predictions(predictions.numpy())[0][0]
    return top_prediction[1], top_prediction[2]
