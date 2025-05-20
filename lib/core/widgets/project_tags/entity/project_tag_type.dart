import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';

@immutable
abstract class ProjectTagType {
  const ProjectTagType();

  Color bgColor(BuildContext context);

  Color textColor(BuildContext context);
}

class ProjectTagInfoType extends ProjectTagType {
  const ProjectTagInfoType();

  @override
  Color bgColor(BuildContext context) {
    return AppColors.of(context).bs.infoLight;
  }

  @override
  Color textColor(BuildContext context) {
    return AppColors.of(context).text.info;
  }
}

class ProjectTagPositiveType extends ProjectTagType {
  const ProjectTagPositiveType();

  @override
  Color bgColor(BuildContext context) {
    return AppColors.of(context).bs.positiveLight;
  }

  @override
  Color textColor(BuildContext context) {
    return AppColors.of(context).text.positive;
  }
}

class ProjectTagWarnType extends ProjectTagType {
  const ProjectTagWarnType();

  @override
  Color bgColor(BuildContext context) {
    return AppColors.of(context).bs.warnLight;
  }

  @override
  Color textColor(BuildContext context) {
    return AppColors.of(context).text.warn;
  }
}

class ProjectTagDangerType extends ProjectTagType {
  const ProjectTagDangerType();

  @override
  Color bgColor(BuildContext context) {
    return AppColors.of(context).bs.dangerLight;
  }

  @override
  Color textColor(BuildContext context) {
    return AppColors.of(context).text.danger;
  }
}

class ProjectTagBrandType extends ProjectTagType {
  const ProjectTagBrandType();

  @override
  Color bgColor(BuildContext context) {
    return AppColors.of(context).bs.brandLight;
  }

  @override
  Color textColor(BuildContext context) {
    return AppColors.of(context).text.brand;
  }
}
