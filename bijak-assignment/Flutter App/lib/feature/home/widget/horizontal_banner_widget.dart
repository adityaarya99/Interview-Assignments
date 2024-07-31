part of home_screen;

class HorizontalBannerWidget extends StatelessWidget {
  final String assetImage;
  const HorizontalBannerWidget({
    super.key,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                assetImage,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
