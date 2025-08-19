import 'package:shoppe/export.dart';

class InternetHandler extends StatefulWidget {

  const InternetHandler({super.key, required this.child});
  final Widget child;

  @override
  State<InternetHandler> createState() => _InternetHandlerState();
}

class _InternetHandlerState extends State<InternetHandler> {
  final InternetService _service = InternetService();

  @override
  void initState() {
    super.initState();
    _service.init();
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _service.isConnected,
      builder: (_, isConnected, child) {
        return Stack(children: [child!, if (!isConnected) NoInternetScreen()]);
      },
      child: widget.child,
    );
  }
}
