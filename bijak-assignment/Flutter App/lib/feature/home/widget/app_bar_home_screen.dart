part of home_screen;

class AppBarHomeScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      ///Leading
      leading: Container(
        margin: const EdgeInsets.only(
          left: 16.0,
        ),
        child: IconButton(
          onPressed: () {},
          icon: AppIcons.profileIcon,
          color: AppColors.colorWhite,
        ),
      ),
      centerTitle: true,
      title: Text(
        "Bijak",
        style: AppTextStyle.f16w700.copyWith(
          color: AppColors.colorWhite,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () {},
            icon: AppIcons.logoutIcon,
            color: AppColors.colorWhite,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
