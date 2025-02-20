import 'package:ai_weather/core/helper/request_permission.dart';
import 'package:location/location.dart';

class GetLocation {
  static Future<String> getCurrentLocation() async {
    Location location = Location();
    LocationData? locationData;
    await RequestPermission.locationPermission(location: location);
    locationData = await location.getLocation();
    return '${locationData.latitude},${locationData.longitude}';
  }
}
