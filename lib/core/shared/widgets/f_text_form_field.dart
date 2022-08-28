import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_pdf/core/shared/theme/talma_colors.dart';
import 'package:invoice_pdf/core/shared/theme/theme.dart';

class FTextFormField extends StatelessWidget {
  const FTextFormField({
    Key? key,
    required this.hintText,
    this.formatter,
    this.suffix,
    this.preffix,
    this.enabled = true,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.onFocus,
    this.borderRadius = 8,
    this.readOnly = false,
    this.autofocus,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.height,
    this.enableShadow = true,
    this.labelColor,
    this.backgroundColor,
    this.contentPadding,
    this.styleText,
    this.titleInput,
    this.styleTitle,
    this.textCapitalization = TextCapitalization.none,
    this.titleMaxLines = 1,
    this.autovalidateMode,
    this.maxLength,
    this.onTap,
    this.errorMaxLines = 1,
    this.autoExpand = false,
    this.focusNode,
    this.initialValue,
  }) : super(key: key);

  /// `hintext` for the input
  final String hintText;

  /// format text
  final List<TextInputFormatter>? formatter;

  /// `suffix` for the input
  final Widget? suffix;

  /// `preffix` for the input
  final Widget? preffix;

  /// specify if the input is `enabled` for edition
  final bool enabled;

  /// A [TextEditingController] for the input
  final TextEditingController? controller;

  /// A [FormFieldValidator] for the input
  final FormFieldValidator<String?>? validator;

  /// `maxLines` for the text input
  final int maxLines;

  /// Invoked when the input is `onFocus`
  final VoidCallback? onFocus;

  /// `borderRadius` for the input
  final double borderRadius;

  /// Force the input to work as `readOnly`
  final bool readOnly;

  /// Force `autofocus` when the widget is build for first time
  final bool? autofocus;

  /// `textAlign` for the text input
  final TextAlign textAlign;

  /// A callback invoked when the text is changed
  final ValueSetter<String>? onChanged;

  /// A callback invoked when the text is submit
  final ValueSetter<String>? onFieldSubmitted;

  /// Type of the textField
  final TextInputType textInputType;

  final bool obscureText;

  final double? height;

  final bool enableShadow;

  final Color? labelColor;

  final Color? backgroundColor;

  final EdgeInsetsGeometry? contentPadding;

  final TextStyle? styleText;

  final String? titleInput;

  final TextStyle? styleTitle;

  final TextCapitalization textCapitalization;

  final int titleMaxLines;

  final AutovalidateMode? autovalidateMode;

  final int? maxLength;

  final VoidCallback? onTap;
  final int errorMaxLines;

  final bool autoExpand;

  final FocusNode? focusNode;

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final theme = InoviceTheme.theme;
    final restrictEmoji = FilteringTextInputFormatter.allow(
      RegExp(r'[\ $A-Za-z0-9À-ÿ@#""$^&()%*+-._/|,:;`~?<>!]*'),
    );
    final inputFormatters = <TextInputFormatter>[restrictEmoji];
    if (formatter != null) {
      inputFormatters.addAll(formatter!);
    }
    if (maxLength != null) {
      inputFormatters.add(LengthLimitingTextInputFormatter(maxLength));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (titleInput != null) ...[
          Text(
            titleInput!,
            style: styleTitle ??
                theme.textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: InvoiceColor.textBodyBlack.withOpacity(0.3),
                ),
            maxLines: titleMaxLines,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
        Stack(
          children: [
            Container(
              height: height ?? 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  if (enableShadow)
                    const BoxShadow(
                      color: InvoiceColor.shadow,
                      blurRadius: 30,
                      offset: Offset(0, 6),
                    ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: onTap,
              child: TextFormField(
                initialValue: initialValue,
                validator: validator,
                onFieldSubmitted: onFieldSubmitted,
                autovalidateMode: autovalidateMode,
                onTap: onFocus,
                autofocus: autofocus ?? false,
                keyboardType: textInputType,
                inputFormatters: inputFormatters,
                controller: controller,
                textCapitalization: textCapitalization,
                enabled: enabled,
                obscureText: obscureText,
                enableInteractiveSelection: !readOnly,
                readOnly: readOnly,
                maxLines: autoExpand ? null : maxLines,
                textAlign: textAlign,
                focusNode: focusNode,
                style: styleText ??
                    TextStyle(
                      color: readOnly ? theme.disabledColor : null,
                      fontSize: theme.textTheme.bodyText2?.fontSize,
                    ),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  fillColor: backgroundColor ?? theme.backgroundColor,
                  contentPadding: contentPadding ?? const EdgeInsets.all(16),
                  filled: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide:
                        const BorderSide(color: InvoiceColor.supportRed),
                  ),
                  prefixIcon: preffix,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide:
                        const BorderSide(color: InvoiceColor.supportRed),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: suffix,
                  hintText: hintText,
                  focusColor: Theme.of(context).primaryColor,
                  hintStyle: TextStyle(
                    color: enabled || readOnly
                        ? labelColor ?? theme.disabledColor
                        : null,
                  ),
                  errorMaxLines: 2,
                  errorStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: InvoiceColor.errorRed,
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
