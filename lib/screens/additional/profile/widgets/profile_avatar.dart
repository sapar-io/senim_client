part of profile;

class _ProfileAvatar extends StatefulWidget {
  const _ProfileAvatar({Key? key}) : super(key: key);

  @override
  State<_ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<_ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _mobile(context),
      desktop: _desktop(context),
    );
  }

  Widget _mobile(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
          ),
          const SizedBox(height: 24.0),
          const Text("Мы поддерживаем .JPG, PNG, asdfasdf"),
          const SizedBox(height: 16.0),
          SMButton(
              title: "Загрузить фотографию",
              width: SMButtonWidth.fill,
              height: SMButtonHeight.medium,
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget _desktop(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
        ),
        const SizedBox(width: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Мы поддерживаем .JPG, PNG, asdfasdf"),
            const SizedBox(height: 16.0),
            SMButton(
                title: "Загрузить фотографию",
                width: SMButtonWidth.content,
                height: SMButtonHeight.medium,
                onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
