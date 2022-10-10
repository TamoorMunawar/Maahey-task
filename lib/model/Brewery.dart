class Brewery {
  String? _id;
  String? _name;
  String? _breweryType;
  String? _street;
  String? _address2;
  String? _address3;
  String? _city;
  String? _state;
  String? _countyProvince;
  String? _postalCode;
  String? _country;
  String? _longitude;
  String? _latitude;
  String? _phone;
  String? _websiteUrl;
  String? _updatedAt;
  String? _createdAt;

  Brewery(
      {String? id,
      String? name,
      String? breweryType,
      String? street,
      String? address2,
      String? address3,
      String? city,
      String? state,
      String? countyProvince,
      String? postalCode,
      String? country,
      String? longitude,
      String? latitude,
      String? phone,
      String? websiteUrl,
      String? updatedAt,
      String? createdAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (breweryType != null) {
      this._breweryType = breweryType;
    }
    if (street != null) {
      this._street = street;
    }
    if (address2 != null) {
      this._address2 = address2;
    }
    if (address3 != null) {
      this._address3 = address3;
    }
    if (city != null) {
      this._city = city;
    }
    if (state != null) {
      this._state = state;
    }
    if (countyProvince != null) {
      this._countyProvince = countyProvince;
    }
    if (postalCode != null) {
      this._postalCode = postalCode;
    }
    if (country != null) {
      this._country = country;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (websiteUrl != null) {
      this._websiteUrl = websiteUrl;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get breweryType => _breweryType;
  set breweryType(String? breweryType) => _breweryType = breweryType;
  String? get street => _street;
  set street(String? street) => _street = street;
  String? get address2 => _address2;
  set address2(String? address2) => _address2 = address2;
  String? get address3 => _address3;
  set address3(String? address3) => _address3 = address3;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get countyProvince => _countyProvince;
  set countyProvince(String? countyProvince) =>
      _countyProvince = countyProvince;
  String? get postalCode => _postalCode;
  set postalCode(String? postalCode) => _postalCode = postalCode;
  String? get country => _country;
  set country(String? country) => _country = country;
  String? get longitude => _longitude;
  set longitude(String? longitude) => _longitude = longitude;
  String? get latitude => _latitude;
  set latitude(String? latitude) => _latitude = latitude;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get websiteUrl => _websiteUrl;
  set websiteUrl(String? websiteUrl) => _websiteUrl = websiteUrl;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;

  Brewery.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _breweryType = json['brewery_type'];
    _street = json['street'];
    _address2 = json['address_2'];
    _address3 = json['address_3'];
    _city = json['city'];
    _state = json['state'];
    _countyProvince = json['county_province'];
    _postalCode = json['postal_code'];
    _country = json['country'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _phone = json['phone'];
    _websiteUrl = json['website_url'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['brewery_type'] = this._breweryType;
    data['street'] = this._street;
    data['address_2'] = this._address2;
    data['address_3'] = this._address3;
    data['city'] = this._city;
    data['state'] = this._state;
    data['county_province'] = this._countyProvince;
    data['postal_code'] = this._postalCode;
    data['country'] = this._country;
    data['longitude'] = this._longitude;
    data['latitude'] = this._latitude;
    data['phone'] = this._phone;
    data['website_url'] = this._websiteUrl;
    data['updated_at'] = this._updatedAt;
    data['created_at'] = this._createdAt;
    return data;
  }
}
