import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KNPWidgets {
  /* --------------------------Normal Widgets View--------------------------*/
  static Widget appBarView({String? title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.px),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(18.px),
            onTap: () => Get.back(),
            child: Container(
              width: 36.px,
              height: 36.px,
              margin: EdgeInsets.symmetric(horizontal: 12.px),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(Get.context!).colorScheme.primary,
                      width: 1.px)),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(Get.context!).colorScheme.inversePrimary,
                  size: 16.px,
                ),
              ),
            ),
          ),
          Flexible(
            child: Text(
              title ?? '',
              style: Theme.of(Get.context!).textTheme.headlineLarge,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 10.px)
        ],
      ),
    );
  }

  static Widget commonNetworkImageView({
    required String path,
    bool isAssetImage = false,
    double? height,
    double? width,
    double? radius,
    Color? color,
    BoxFit fit = BoxFit.fill,
    GestureTapCallback? onTap,
    ImageLoadingBuilder? loadingBuilder,
    Duration? shimmerDuration,
    Color? shimmerBackgroundColor,
    Color? shimmerMovementColor,
    String? errorImage,
    String? userShortName,
    Color? userShortNameColor,
    Color? userShortNameBackgroundColor,
  }) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius ?? 0.px),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 0.px),
          child: isAssetImage
              ? Image.asset(
                  path,
                  height: height,
                  width: width,
                  color: color,
                  fit: fit,
                )
              : Image.network(
                  path,
                  height: height,
                  width: width,
                  color: color,
                  fit: fit,
                  loadingBuilder: loadingBuilder ?? (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: height,
                      child: Center(
                        child: commonProgressBarView(
                          value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    errorImage ?? 'assets/image/default_image.jpg',
                    height: height,
                    width: width,
                    color: color,
                    fit: fit,
                  );
                }),
        ),
      );

  static commonContainerView({EdgeInsetsGeometry? padding,required Widget child,double? width, double? height,Color? color,Color? borderColor}) => Container(
    height: height,
    width: width,
    padding: padding ?? EdgeInsets.all(16.px),
    decoration: BoxDecoration(
        color: color ?? Theme.of(Get.context!).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.px),
        boxShadow: [
          BoxShadow(
              color: Theme.of(Get.context!).colorScheme.surface.withOpacity(.2),
              spreadRadius: 2.px,
              blurRadius: 1.px
          )
        ],
      border: Border.all(
        color: borderColor ?? Theme.of(Get.context!).colorScheme.onSecondary,
      )
    ),
    child: child,
  );

  static Widget scaffoldBackgroundImageView({required Widget child}) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(Get.context!).size.height,
        child: Stack(
          children: [
            commonNetworkImageView(
                path: 'assets/image/background_img.png',
                isAssetImage: true,
                width: double.infinity,
                height: double.infinity),
            SafeArea(child: child)
          ],
        ),
      ),
    );
  }

  static Widget scaffoldBackgroundImageViewWithAppBar({
    required Widget child2,
    bool appBarValue = true,
    bool isHomeAppBarValue = false,
    String? appBarTitle,
    Widget? child1,
  }) {
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.light, // For Android(M and greater): (dark icons)
    );
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(Get.context!).size.height,
        child: Stack(
          children: [
            commonNetworkImageView(
              path: 'assets/image/background_img.png',
              isAssetImage: true,
              width: double.infinity,
              height: double.infinity,
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(appBarValue)
                  isHomeAppBarValue
                      ? Padding(
                         padding: EdgeInsets.symmetric(vertical: 20.px,horizontal: 12.px),
                         child: commonNetworkImageView(path: 'assets/image/logoipsum_image.png',height: 24.px,width: 115.px,isAssetImage: true),
                      )
                      : appBarView(title: appBarTitle),
                  if(child1 != null)
                  SizedBox(height: appBarValue ? 3.h : 10.h),
                  if(child1 != null)
                  child1,
                  if(child1 != null)
                  SizedBox(height: appBarValue ? 9.h : 12.h),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 0.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.px),
                          topLeft: Radius.circular(16.px),
                        ),
                        color: Theme.of(Get.context!).colorScheme.inversePrimary,
                      ),
                      child: child2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget commonTextFormField({
    TextEditingController? controller,
    required String title,
    String? hintText,
    FocusNode? focusNode,
    bool filled = true,
    bool readOnly = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    EdgeInsetsGeometry? contentPadding,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    Widget? suffixIcon,
    Widget? prefixIcon,
    EdgeInsetsGeometry? suffixPadding,
    EdgeInsetsGeometry? prefixPadding,
    int? maxLength,
    bool obscureText = false,
    bool autofocus = false,
    String? hideTextCharacter,
    GestureTapCallback? onTap,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Focus(
          onFocusChange: (hasFocus) {
            setState(() {});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: focusNode?.hasFocus == true
                        ? Theme.of(Get.context!).colorScheme.primary
                        : Theme.of(Get.context!).colorScheme.onInverseSurface),
              ),
              SizedBox(height: 4.px),
              TextFormField(
                onTap: onTap,
                obscureText: obscureText,
                textCapitalization: textCapitalization,
                focusNode: focusNode,
                inputFormatters: keyboardType == TextInputType.number
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]
                    : inputFormatters,
                onChanged: keyboardType == TextInputType.number
                    ? (value) {}
                    : onChanged ?? (value) {
                          value = value.trim();
                          if (value.isEmpty ||
                              value.replaceAll(" ", "").isEmpty) {
                            controller?.text = "";
                          }
                        },
                keyboardType: keyboardType,
                validator: validator,
                readOnly: readOnly,
                controller: controller,
                style: Theme.of(Get.context!).textTheme.bodyMedium,
                maxLength: maxLength,
                autofocus: autofocus,
                obscuringCharacter: hideTextCharacter ?? '•',
                decoration: InputDecoration(
                  counterText: '',
                  hintText: hintText,
                  fillColor: focusNode?.hasFocus == true
                      ? Theme.of(Get.context!).colorScheme.primary.withOpacity(.1)
                      : Theme.of(Get.context!).colorScheme.surface,
                  filled: filled,
                  contentPadding:
                      contentPadding ?? EdgeInsets.symmetric(horizontal: 20.px),
                  hintStyle: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, color: Theme.of(Get.context!).colorScheme.onSurface),
                  suffixIcon: suffixIcon != null
                      ? Padding(
                          padding: suffixPadding ?? EdgeInsets.zero,
                          child: suffixIcon,
                        )
                      : null,
                  prefixIcon: prefixIcon != null
                      ? Padding(
                          padding: prefixPadding ?? EdgeInsets.zero,
                          child: prefixIcon,
                        )
                      : null,
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(Get.context!).colorScheme.onSecondary,
                        width: 1.5.px),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(Get.context!).colorScheme.primary,
                        width: 1.5.px),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(Get.context!).colorScheme.error,
                        width: 1.5.px),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(Get.context!).colorScheme.primary,
                        width: 1.5.px),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(Get.context!).colorScheme.onSecondary,
                        width: 1.5.px),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(Get.context!).colorScheme.error,
                        width: 1.5.px),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget commonCheckBoxView(
          {required bool changeValue,
          required ValueChanged<bool?>? onChanged,
          OutlinedBorder? shape,
          Color? activeFillColor,
          Color? checkColor,
          Color? borderColor,
          VisualDensity? visualDensity}) => Checkbox(
        visualDensity: visualDensity,
        value: changeValue,
        onChanged: onChanged,
        activeColor: activeFillColor ?? Theme.of(Get.context!).colorScheme.primary,
        checkColor: checkColor ?? Theme.of(Get.context!).colorScheme.inversePrimary,
        splashRadius: 24.px,
        side: BorderSide(
            color: borderColor ?? Theme.of(Get.context!).colorScheme.onSurface,
            width: 1.px),
        shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.px)),
      );

  static Widget commonDividerView({
    Color? color,
    double? height,
    double? wight,
    double? leftPadding,
    double? rightPadding,
  }) => Divider(
        color: color ?? Theme.of(Get.context!).colorScheme.onSecondary,
        height: height ?? 10.px,
        thickness: wight ?? .5.px,
        endIndent: rightPadding,
        indent: leftPadding,
      );

  static Widget commonOtpView(
      {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
      PinCodeFieldShape shape = PinCodeFieldShape.box,
      TextInputType keyboardType = TextInputType.number,
      List<TextInputFormatter>? inputFormatters,
      TextEditingController? controller,
      ValueChanged<String>? onChanged,
      ValueChanged<String>? onCompleted,
      String? hintCharacter,
      int length = 6,
      double? height,
      double? width,
      double? borderRadius,
      double? borderWidth,
      bool readOnly = false,
      bool autoFocus = false,
      bool enableActiveFill = true,
      bool enablePinAutofill = true,
      bool autoDismissKeyboard = true,
      TextStyle? textStyle,
      Color? cursorColor,
      Color? inactiveColor,
      Color? inactiveFillColor,
      Color? activeColor,
      Color? activeFillColor,
      Color? selectedColor,
      Color? selectedFillColor,
      FormFieldValidator<String>? validator}) {
    return PinCodeTextField(
      length: length,
      mainAxisAlignment: mainAxisAlignment,
      appContext: Get.context!,
      cursorColor: cursorColor ?? Theme.of(Get.context!).colorScheme.primary,
      autoFocus: autoFocus,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters ??
          <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      readOnly: readOnly,
      textStyle: textStyle ?? Theme.of(Get.context!).textTheme.labelLarge,
      autoDisposeControllers: false,
      enabled: true,
      animationType: AnimationType.fade,
      hintCharacter: hintCharacter ?? "-",
      hintStyle: textStyle ?? Theme.of(Get.context!).textTheme.bodyLarge,
      scrollPadding: EdgeInsets.zero,
      validator: validator,
      errorTextMargin: EdgeInsets.only(top: 55.px),
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.zero,
        inactiveColor:
            inactiveColor ?? Theme.of(Get.context!).colorScheme.surface,
        inactiveFillColor:
            inactiveFillColor ?? Theme.of(Get.context!).colorScheme.surface,
        selectedColor:
            selectedColor ?? Theme.of(Get.context!).colorScheme.primary,
        selectedFillColor: selectedFillColor ??
            Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
        activeColor: activeColor ?? Theme.of(Get.context!).colorScheme.primary,
        activeFillColor: activeFillColor ??
            Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
        shape: shape,
        fieldWidth: width ?? 46.px,
        fieldHeight: height ?? 55.px,
        borderWidth: borderWidth ?? 1.px,
        selectedBorderWidth: 1.5,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.px),
      ),
      enableActiveFill:
          shape == PinCodeFieldShape.box || shape == PinCodeFieldShape.circle
              ? true
              : false,
      controller: controller,
      onChanged: onChanged,
      enablePinAutofill: enablePinAutofill,
      onCompleted: onCompleted,
      autoDismissKeyboard: autoDismissKeyboard,
    );
  }

  /* --------------------------Progress Bar View--------------------------*/
  static commonProgressBarView(
          {Color? color,
          Color? backgroundColor,
          double? value,
          double? strokeWidth}) => Center(
        child: CircularProgressIndicator(
          backgroundColor: backgroundColor ?? Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
          color: color ?? Theme.of(Get.context!).colorScheme.primary,
          value: value,
          strokeWidth: strokeWidth ?? 3,
          strokeCap: StrokeCap.round,
        ),
      );

  static Widget commonLinearProgressBar({required double value, double? height,Color? color,Color? backgroundColor,}) => ClipRRect(
    borderRadius: BorderRadius.circular(20.px),
    child: LinearProgressIndicator(
      color: color ?? Theme.of(Get.context!).colorScheme.primary,
      backgroundColor: backgroundColor ?? Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
      value: value,
      minHeight: height ?? 10.px,
    ),
  );

  /* --------------------------Buttons View--------------------------*/
  static Widget commonElevatedButton(
      {double? height,
      double? width,
      double? progressBarHeight,
      double? progressBarWidth,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      double? borderRadius,
      Color? splashColor,
      Color? buttonColor,
      double? elevation,
      bool isContentSizeButton = true,
      required VoidCallback onPressed,
      Widget? child,
      String? buttonText,
      double? fontSize,
      Color? buttonTextColor,
      bool isLoading = false}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 0.px,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 32.px),
        ),
        minimumSize: Size(
          width ?? 312.px,
          height ?? 52.px,
        ),
        shadowColor: Colors.transparent,
      ),
      child: isLoading
          ? Center(
              child: SizedBox(
                height: progressBarHeight ?? 24.px,
                width: progressBarWidth ?? 24.px,
                child: commonProgressBarView(
                    color: Theme.of(Get.context!).colorScheme.inversePrimary),
              ),
            )
          : child ??
              Text(
                buttonText ?? '',
                style: Theme.of(Get.context!)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: fontSize, color: buttonTextColor),
              ),
    );
  }

  static Widget commonOutlineButton(
      {double? height,
      double? width,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      double? progressBarHeight,
      double? progressBarWidth,
      double? borderRadius,
      double? borderWidth,
      Color? borderColor,
      Color? backgroundColor,
      double? elevation,
      bool isContentSizeButton = true,
      required VoidCallback onPressed,
      Widget? child,
      String? buttonText,
      double? fontSize,
      Color? buttonTextColor,
      bool isLoading = false}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: elevation ?? 0.px,
        padding: padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 32.px),
        ),
        side: BorderSide(
          color: borderColor ?? Theme.of(Get.context!).colorScheme.primary,
          width: borderWidth ?? 1.5.px,
        ),
        backgroundColor: backgroundColor ?? Colors.transparent,
        shadowColor: Colors.transparent,
        minimumSize: Size(
          width ?? 312.px,
          height ?? 52.px,
        ),
      ),
      child: isLoading
          ? Center(
              child: SizedBox(
                height: progressBarHeight ?? 24.px,
                width: progressBarWidth ?? 24.px,
                child: commonProgressBarView(
                    color: Theme.of(Get.context!).colorScheme.inversePrimary),
              ),
            )
          : child ??
              Text(
                buttonText ?? '',
                style: Theme.of(Get.context!)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: fontSize, color: buttonTextColor),
              ),
    );
  }

  static Widget commonTextButton({
    required VoidCallback onPressed,
    required String buttonText,
    double? fontSize,
    Color? buttonTextColor,
  }) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            visualDensity: VisualDensity(vertical: -4.px, horizontal: -4.px),
            padding: EdgeInsets.zero),
        child: Text(
          buttonText,
          style: Theme.of(Get.context!)
              .textTheme
              .labelSmall
              ?.copyWith(fontSize: fontSize, color: buttonTextColor),
        ));
  }


  /* --------------------------Banner View--------------------------*/

  ///flutter pub add carousel_slider :- For Banner
  static Widget commonBannerView({
    required List<String> imageList,
    required int selectedIndex,
    EdgeInsetsGeometry? padding,
    required Function(int index, CarouselPageChangedReason reason)?onPageChanged,
    CarouselController? carouselController,
    double? height,
    double? borderRadius,
    bool autoPlay = true,
    bool isIndicator = true,
    double? indicatorHeight,
    double? indicatorWidth,
    double? indicatorBottomPadding,
    double? indicatorSpace,
    double? indicatorCornerRadius,
    Color? indicatorActiveColor,
    Color? indicatorInactiveColor,
    int indicatorAnimationDuration = 300,
  }) => Stack(
    alignment: Alignment.bottomCenter,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12.px),
        child: CarouselSlider(
          items: imageList.isNotEmpty
              ? imageList.map((image) {
            return ClipRRect(
              borderRadius:
              BorderRadius.circular(borderRadius ?? 12.px),
              child: Material(
                color: Theme.of(Get.context!).colorScheme.surface,
                child: commonNetworkImageView(
                    path: image,
                    isAssetImage: false,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: height ?? 150.px),
              ),
            );
          }).toList()
              : [],
          carouselController: carouselController,
          options: CarouselOptions(
            autoPlay: autoPlay,
            height: height ?? 150.px,
            // enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: onPageChanged,
          ),
        ),
      ),
      if (isIndicator)
        commonBannerIndicatorView(
            selectedIndex: selectedIndex,
            length: imageList.length,
            height: indicatorHeight,
            width: indicatorWidth,
            activeColor: indicatorActiveColor,
            inactiveColor: indicatorInactiveColor,
            bottomPadding: indicatorBottomPadding,
            animationDuration: indicatorAnimationDuration,
            cornerRadius: indicatorCornerRadius,
            space: indicatorSpace),
    ],
  );

  /* --------------------------Banner Indicator View--------------------------*/

  ///flutter pub add carousel_indicator :- For Banner Indicator
  static Widget commonBannerIndicatorView({
    required int selectedIndex,
    required int length,
    int animationDuration = 300,
    double? height,
    double? width,
    double? bottomPadding,
    double? space,
    double? cornerRadius,
    Color? activeColor,
    Color? inactiveColor,
  }) => Padding(
    padding: EdgeInsets.only(bottom: bottomPadding ?? 12.px),
    child: CarouselIndicator(
      count: length,
      index: selectedIndex,
      height: height ?? 6.px,
      color: inactiveColor ?? Theme.of(Get.context!).colorScheme.inversePrimary,
      width: width ?? 20.px,
      activeColor: activeColor ?? Theme.of(Get.context!).colorScheme.primary,
      cornerRadius: cornerRadius ?? 6.px,
      space: space ?? 4.px,
      animationDuration: animationDuration,
    ),
  );

}
