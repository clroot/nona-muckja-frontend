import 'package:geolocator/geolocator.dart';
import 'package:nonamukja/model/party/party_search_model.dart';
import 'package:nonamukja/resources/service/category_maping.dart';
import 'package:nonamukja/resources/repositories/location/user_location_repository.dart';

class PartySearchRepository {
  UserLocationRepository userLocationRepository = UserLocationRepository();
  Future<PartySearch> getPartySearchList(String category) async {
    String selectedCategory = MappingKorean[category];
    print(selectedCategory);
    Position userLocation = await userLocationRepository.currentUserLocation();
    return PartySearch.fromJson({
      'clientLocation': {
        'latitude': userLocation.latitude,
        'longitude': userLocation.longitude
      },
      'foodCategories': [selectedCategory],
      'radius': 1000,
      'status': 'OPEN'
    });
  }
}
