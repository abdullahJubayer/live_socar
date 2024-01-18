import 'package:flutter/material.dart';
import 'package:live_score/utils/theme/text_theme.dart';
import 'package:live_score/utils/widgets/custom_card.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../theme/custom_themes.dart';
import 'package:collection/collection.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable(
      {Key? key,
      required this.cells,
      this.backgroundColor,
      this.color,
      this.cornerRadius,
      required this.columnTitle,
      this.headerColor,
      this.headerTextColor,
      this.rowHeight,
      this.margin,
      this.padding,
      this.onCellTap,
      this.showHeader = true,
      this.shrinkWrap = false})
      : super(key: key);

  final List<List<DataTableRow>> cells;
  final Color? backgroundColor;
  final Color? color;
  final double? cornerRadius;
  final List<ColumnTitle> columnTitle;
  final Color? headerColor;
  final Color? headerTextColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? rowHeight;
  final void Function(int index)? onCellTap;
  final bool shrinkWrap;
  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CustomCard(
        padding: padding ?? const EdgeInsets.all(0),
        margin: margin ?? const EdgeInsets.all(0),
        backgroundColor: backgroundColor ?? Colors.transparent,
        borderRadius: cornerRadius ?? 8,
        child: SfDataGrid(
            shrinkWrapRows: shrinkWrap,
            verticalScrollPhysics: shrinkWrap
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),

            // shrinkWrapColumns: shrinkWrap,
            source: TableRow(cells: cells, columnTitle: columnTitle,theme: theme),
            columnWidthMode: ColumnWidthMode.fill,
            gridLinesVisibility: GridLinesVisibility.none,
            headerRowHeight: showHeader ? rowHeight ?? double.nan : 0,
            rowHeight: rowHeight ?? double.nan,
            headerGridLinesVisibility: GridLinesVisibility.none,
            onCellTap: (details) {
              if (onCellTap != null && details.rowColumnIndex.rowIndex > 0) {
                onCellTap!.call(details.rowColumnIndex.rowIndex - 1);
              }
            },
            columns: columnTitle
                .map(
                  (e) => GridColumn(
                      columnName: e.title,
                      width: e.width ?? double.nan,
                      label: Container(
                          decoration: BoxDecoration(
                            color: headerColor,
                            border: const Border(
                              left: BorderSide(
                                color: CustomColors.lightGrey,
                                width: .5,
                              ),
                              right: BorderSide(
                                color: CustomColors.lightGrey,
                                width: .5,
                              ),
                              bottom: BorderSide(
                                color: CustomColors.lightGrey,
                                width: 1,
                              ),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            e.title,
                            textAlign: e.textAlign,
                            style: theme.textTheme.mediumFont.copyWith(
                                fontSize: e.textSize ?? 14,
                                color: headerTextColor,
                                fontWeight: FontWeight.bold),
                          ))),
                )
                .toList()));
  }
}

class TableRow extends DataGridSource {
  TableRow({required this.cells, required this.columnTitle,required this.theme});

  final List<List<DataTableRow>> cells;

  final List<ColumnTitle> columnTitle;

  final ThemeData theme;

  @override
  List<DataGridRow> get rows {
    return cells
        .map((value) => DataGridRow(
                cells: columnTitle.map((e) {
              final item =
                  value.firstWhere((element) => e.title == element.title);
              return DataGridCell(columnName: e.title, value: item.value);
            }).toList()))
        .toList();
  }

  List<DataTableRow>? rowItems(DataGridRow row) {
    final cell = cells.firstWhereOrNull((element) {
      for (var value in element) {
        bool hasCell = row.getCells().any((element) =>
            element.columnName == value.title && element.value == value.value);
        if (!hasCell) return false;
      }
      return true;
    });

    return cell;
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final data = rowItems(row);
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      final item =
          data?.firstWhereOrNull((element) => element.title == e.columnName);
      final color = item?.color;
      final title =
          columnTitle.firstWhere((element) => element.title == e.columnName);
      return Container(
        margin: const EdgeInsets.only(
          bottom: 3,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          color: color ?? title.color,
          border: const Border(
            left: BorderSide(
              color: Colors.white,
              width: .5,
            ),
            right: BorderSide(
              color: Colors.white,
              width: .5,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          e.value.toString(),
          style: theme.textTheme.regularFont.copyWith(
              color: title.textColor,
              fontWeight: title.isBold ? FontWeight.bold : null,
              fontSize: title.textSize),
          textAlign: title.textAlign,
        ),
      );
    }).toList());
  }
}

class ColumnTitle {
  ColumnTitle(
      {required this.title,
      this.width,
      this.color,
      this.textColor,
      this.isBold = false,
      this.textSize,
      this.textAlign=TextAlign.center
      });

  String title;
  double? width;
  Color? color;
  Color? textColor;
  bool isBold;
  double? textSize;
  TextAlign? textAlign;
}

class DataTableRow {
  DataTableRow(
      {required this.title, required this.value, this.color, this.textSize,this.textAlign=TextAlign.center});

  String title;
  String value;
  Color? color;
  double? textSize;
  TextAlign? textAlign;
}
