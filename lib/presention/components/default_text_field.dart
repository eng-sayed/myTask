import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/themes/colors.dart';
import '../../core/utiles/validation.dart';
import 'custom_text.dart';

class TextFeildWithCustomValidation extends StatefulWidget {
  TextFeildWithCustomValidation({
    Key? key,
    this.controller,
    required this.keyboardType,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.border,
    this.minlines,
    this.function,
    this.maxlines,
    this.height,
    this.inputFormatters,
    this.color,
    this.enabled,
    this.prefix,
    this.colorBoarder,
    this.onChange,
    this.showBorder,
    this.disableborder,
    this.enabledborder,
    this.foucsborder,
    this.hintColor,
    required this.validate,
    this.readOnly = false,
    this.focusNode,
  }) : super(key: key);
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  String? label;
  String? hintText;
  Widget? prefix;
  double? height;
  bool? enabled;
  bool? showBorder;
  String? Function(String?) validate;
  FocusNode? focusNode;
  InputBorder? border;
  InputBorder? foucsborder;
  InputBorder? disableborder;
  InputBorder? enabledborder;
  int? minlines;
  Color? color;
  Color? hintColor;
  bool readOnly;

  Color? colorBoarder;
  int? maxlines;
  Function? function;
  List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChange;

  @override
  State<TextFeildWithCustomValidation> createState() =>
      _TextFeildWithCustomValidationState();
}

class _TextFeildWithCustomValidationState
    extends State<TextFeildWithCustomValidation> {
  bool? isPass;
  bool? visible;
  @override
  void initState() {
    isPass =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormField<String>(
        initialValue: '',
        validator: widget.validate,
        builder: (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widget.height ?? 42,
              child: TextFormField(
                // autovalidateMode: AutovalidateMode.,

                readOnly: widget.readOnly,
                onTap: () {
                  widget.function?.call();
                },
                // cursorHeight: 100,
                enabled: widget.enabled ?? true,
                cursorColor: AppColors.greyText,
                focusNode: widget.focusNode,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                obscureText: visible!,
                onChanged: (s) {
                  state.didChange(s);
                  widget.onChange?.call(s);
                },
                maxLines: widget.maxlines ?? 1,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 15,
                  // fontFamily: context.locale == Locale('ar', 'EG')
                  //     ? "stc"
                  //     : "grotley"
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: widget.hintColor ?? AppColors.grey,
                  ),
                  suffixIcon: widget.suffixIcon ??
                      (isPass!
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  visible = !visible!;
                                });
                              },
                              icon: Icon(
                                visible!
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.grey,
                              ),
                            )
                          : widget.suffixIcon),
                  labelText: widget.label,
                  hintText: widget.hintText,
                  prefixIcon: widget.prefix,
                  contentPadding:
                      // You can change heigh from vertical size
                      EdgeInsets.symmetric(
                          horizontal: 10, vertical: ((widget.height ?? 2) / 4)),
                  fillColor: widget.color ?? AppColors.white,
                  filled: true,
                  isDense: true,
                  border: widget.border ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primiry,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                  // disabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(0),
                  // ),
                  disabledBorder: widget.disableborder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primiry,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                  focusedBorder: widget.foucsborder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primiry,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                  enabledBorder: widget.enabledborder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: state.hasError
                              ? Colors.red
                              : widget.colorBoarder ?? AppColors.greyText,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: CustomText(state.errorText ?? "",
                    color: Colors.red, fontsize: 12),
              )
          ],
        ),
      ),
    );
  }
}

class LoginTextField extends StatefulWidget {
  LoginTextField({
    Key? key,
    this.controller,
    required this.keyboardType,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.border,
    this.minlines,
    this.function,
    this.maxlines,
    this.height,
    this.inputFormatters,
    this.color,
    this.enabled,
    this.prefix,
    this.colorBoarder,
    this.onChange,
    required this.validate,
    this.focusNode,
  }) : super(key: key);
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  String? label;
  String? hintText;
  Widget? prefix;
  double? height;
  bool? enabled;
  Function? function;
  String? Function(String?) validate;
  FocusNode? focusNode;
  InputBorder? border;
  int? minlines;
  Color? color;
  Color? colorBoarder;
  int? maxlines;
  Function(String)? onChange;
  List<TextInputFormatter>? inputFormatters;
  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool? isPass;
  bool? visible;
  @override
  void initState() {
    isPass =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: widget.height ?? 45,
        child: TextFormField(
            // onTap: () {
            //   widget.function!() ?? null;
            //TODO
            // },

            enabled: widget.enabled ?? true,
            cursorColor: AppColors.greyText,
            onChanged: widget.onChange,
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: visible!,
            minLines: widget.minlines,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxlines ?? 1,
            style: TextStyle(color: AppColors.grey, fontSize: 15, height: 0),
            decoration: InputDecoration(
              // isDense: true,
              hintStyle: TextStyle(color: Color.fromARGB(255, 156, 100, 100)),
              fillColor: AppColors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 12, top: 12),
              //   fillColor: whiteColor70,
              //  filled: true,
              hintText: widget.hintText,
              prefixIcon: widget.prefix,
              // prefix: widget.prefix,
              suffixIcon: widget.suffixIcon ??
                  (isPass!
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              visible = !visible!;
                            });
                          },
                          icon: Icon(
                            visible! ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.grey,
                          ),
                        )
                      : widget.suffixIcon),

              labelText: widget.label,
              border: widget.border ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primiry,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
              // disabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(0),
              // ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primiry,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primiry,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.colorBoarder ?? AppColors.greyText,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: widget.validate),
      ),
    );
  }
}

class DefaultTextField extends StatefulWidget {
  DefaultTextField({
    Key? key,
    this.controller,
    required this.keyboardType,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.border,
    this.minlines,
    this.maxlines,
    this.height,
    this.enable,
    this.onChange,
    required this.validate,
    this.focusNode,
  }) : super(key: key);
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  String? label;
  String? hintText;
  double? height;
  String? Function(String?) validate;
  FocusNode? focusNode;
  InputBorder? border;
  int? minlines;
  int? maxlines;
  bool? enable;
  Function(String)? onChange;
  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool? isPass;
  bool? visible;
  @override
  void initState() {
    isPass =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: widget.height ?? 60,
        child: TextFormField(
            onChanged: widget.onChange,
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: visible!,
            minLines: widget.minlines,
            maxLines: widget.maxlines ?? 1,
            enabled: widget.enable,
            style: TextStyle(color: AppColors.primiry),
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: AppColors.primiry)),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                fillColor: Colors.white,
                filled: true,
                hintText: widget.hintText,
                suffixIcon: widget.suffixIcon ??
                    (isPass!
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible!;
                              });
                            },
                            icon: Icon(
                              visible!
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              // color: Colors.black,
                            ),
                          )
                        : widget.suffixIcon),
                labelText: widget.label,
                border: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: AppColors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: AppColors.white))),
            validator: widget.validate),
      ),
    );
  }
}
