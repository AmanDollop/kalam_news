import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyDropdown<T> extends StatelessWidget {
  final List<T> items;
  final List<String> nameList;
  final T? selectedItem;
  String title;
  String hintText;
  final TextEditingController textEditingController;
  FormFieldValidator<String>? validator;
  bool isOpenValue;
  final Function(T? value) clickOnListOfDropDown;
  GestureTapCallback onTapForTextFiled;
  FocusNode focusNode;

  MyDropdown({
    Key? key,
    required this.title,
    required this.items,
    required this.nameList,
    required this.selectedItem,
    required this.hintText,
    required this.textEditingController,
    required this.isOpenValue,
    required this.clickOnListOfDropDown,
    required this.onTapForTextFiled,
    required this.focusNode,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOpen = false;
    return StatefulBuilder(
      builder: (context, setState) {
        isOpen = isOpenValue;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            KNPWidgets.commonTextFormField(
              title: title,
              hintText: hintText,
              controller: textEditingController,
              validator: validator,
              readOnly: true,
              onTap: onTapForTextFiled,
              focusNode: focusNode,
              suffixIcon: Icon(
                  isOpen ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                  color: /*isOpen ? Theme.of(Get.context!).colorScheme.primary
                      :*/ Theme.of(Get.context!).colorScheme.onInverseSurface,
              size: 24.px),
            ),
            // if(isOpen)
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              constraints: BoxConstraints(maxHeight: isOpen ? 150 : 0),
              curve: Curves.fastOutSlowIn,
              margin: EdgeInsets.only(top: isOpen ? 10.px:0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(Get.context!).colorScheme.onSurface.withOpacity(.5),
                    blurRadius: 10,
                    spreadRadius: 1
                  )
                ],
                color: Theme.of(Get.context!).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(12.px),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: nameList.length,
                padding: EdgeInsets.symmetric(vertical: 8.px, horizontal: 4.px),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Call onChanged callback and pass the selected item
                      clickOnListOfDropDown(items[index]);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: index == nameList.length - 1 ? 0.px : 6.px),
                      padding: EdgeInsets.all(selectedItem == nameList[index] ? 10.px : 6.px),
                      decoration: BoxDecoration(
                        color: selectedItem == nameList[index]
                            ? Theme.of(Get.context!).colorScheme.primary.withOpacity(.1)
                            : null,
                        borderRadius: BorderRadius.circular(8.px),
                      ),
                      child: Row(
                        children: [
                          if (selectedItem == nameList[index])
                            Icon(Icons.check, color: Theme.of(Get.context!).colorScheme.primary, size: 16.px),
                          SizedBox(width: 6.px),
                          Flexible(
                            child: Text(
                              nameList[index],
                              style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: selectedItem == nameList[index] ? Theme.of(Get.context!).colorScheme.primary : Theme.of(Get.context!).colorScheme.secondary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}