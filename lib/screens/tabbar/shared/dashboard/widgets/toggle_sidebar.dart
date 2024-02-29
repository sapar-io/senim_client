part of dashboard;

class _DashboardToggleSidebar extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool hideSidebar;

  const _DashboardToggleSidebar({
    Key? key,
    required this.onPressed,
    required this.hideSidebar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (hideSidebar ? 24 : 256) - (32 / 2),
      top: (96 / 2) - (32 / 2),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 32.0,
          height: 32.0,
          decoration: BoxDecoration(
            color: Theme.of(context).own().dashboardSidebarBackground,
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Icon(
            hideSidebar
                ? Icons.keyboard_arrow_right_rounded
                : Icons.keyboard_arrow_left_rounded,
            color: SMColors.greyscale.shade600,
          ),
        ),
      ),
    );
  }
}
