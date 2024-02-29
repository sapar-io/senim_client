part of dashboard;

class _DashboardSidebar extends StatefulWidget {
  final ValueSetter<int> indexPressed;
  final int currentIndex;

  const _DashboardSidebar({
    Key? key,
    required this.indexPressed,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<_DashboardSidebar> createState() => _DashboardSidebarState();
}

class _DashboardSidebarState extends State<_DashboardSidebar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Logo(),
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 24.0, bottom: 8.0),
                child: Text(
                  "МЕНЮ",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: SMColors.greyscale.shade500,
                      ),
                ),
              ),
              for (var model in DashboardItemModel.menuItems)
                Column(
                  children: [
                    _Item(
                      model: model,
                      isActive: widget.currentIndex == model.currentIndex,
                      onPressed: () {
                        widget.indexPressed(model.currentIndex);
                      },
                    ),
                    const SizedBox(height: 4.0),
                  ],
                )
            ],
          ),
        ),
        Container(color: Theme.of(context).dividerColor, width: 1.0),
      ],
    );
  }
}

// Logo
class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 24.0),
          Icon(
            Icons.dashboard_customize_rounded,
            color: SMColors.primary,
            size: 42,
          ),
          const SizedBox(width: 8),
          Text(
            "Senim.me",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool isActive;
  final DashboardItemModel model;
  final VoidCallback? onPressed;

  const _Item({
    Key? key,
    this.isActive = false,
    required this.model,
    required this.onPressed,
  }) : super(key: key);

  Color? _color(BuildContext context) {
    return isActive ? SMColors.primary : SMColors.greyscale.shade600;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 48.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            children: [
              Icon(
                model.iconData,
                color: _color(context),
              ),
              const SizedBox(width: 16.0),
              Text(
                model.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _color(context),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
