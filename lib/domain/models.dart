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
