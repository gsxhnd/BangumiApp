import 'package:flutter/material.dart';
import '../../utils/DateUtil.dart';

Widget productivityTableRow(List tableData) {
  List<DataRow> _rows = [];
  Widget test = new DataTable(
    columns: [
      DataColumn(label: Text("日期")),
      DataColumn(label: Text('产量')),
      DataColumn(label: Text('记录人')),
    ],
    rows: _rows
  );
  for(var item in tableData) {
    var createdAt = DateUtils().stringToDate(item['created_at'], DateUtils.DATE_PATTERN);
    _rows.add(
        new DataRow(cells: [
          DataCell(Text(createdAt.toString())),
          DataCell(Text(item['quantity'].toString())),
          DataCell(Text("username")),
        ])
    );
  }
  return test;
}