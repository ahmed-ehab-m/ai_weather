# get_prediction subFeature Documentation
## overview/
### this feature predicts status of weather Using Random Forest Model 
### based on List of 5 bool parameters [rainy, sunny, hot, mild, humidity]
### as input and classifies whether the weather conditions are suitable for outdoor activities or not.
## Tools/
### python 3.12
### Flask (app.py) to host random_forest_model.pkl
### numpy
### scikit-learn==1.3.2