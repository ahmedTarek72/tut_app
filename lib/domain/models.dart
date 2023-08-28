// on boarding screen models
class SliderObject {
  final String title;
  final String description;
  final String image;

  SliderObject(
      {required this.title, required this.description, required this.image});
}

class SliderViewObject {
  SliderObject sliderObject;
  int currentIndex;
  int numOfPages;
  SliderViewObject({
    required this.sliderObject,
    required this.currentIndex,
    required this.numOfPages,
  });
}

class Customer {
  String id;

  String name;

  int numOfNotifications;
  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;

  String email;

  String link;
  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer customer;
  Contacts contacts;
  Authentication(this.customer, this.contacts);
}
