import 'package:auto_route/auto_route.dart';
import 'package:coco_explorer/features/explorer/presentation/pages/coco_explorer_page.dart';

export 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: CoCoExplorerPage),
  ],
)
class $AppRouter {}
