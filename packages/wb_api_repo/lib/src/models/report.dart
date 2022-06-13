class ReportResponse {
  List<Report> items;
  int statusCode;
  ReportResponse({
    required this.items,
    required this.statusCode,
  });
}

class Report {
  final int realizationreportId;
  final String suppliercontractCode; //
  final int rrdId;
  final int giId;
  final String subjectName;
  final int nmId;
  final String brandName;
  final String saName;
  final String ts_name;
  final String barcode;
  final String doc_type_name;
  final int quantity;
  final double retail_price; //
  final double retail_amount; //
  final double sale_percent;
  final double commission_percent;
  final String office_name;
  final String supplier_oper_name;
  final String order_dt;
  final String sale_dt;
  final String rr_dt;
  final int shk_id;
  final double retail_price_withdisc_rub; //
  final int delivery_amount;
  final int return_amount;
  final double delivery_rub;
  final String gi_box_type_name;
  final double product_discount_for_report;
  final double supplier_promo;
  final int rid;
  final double ppvz_spp_prc;
  final double ppvz_kvw_prc_base;
  final double ppvz_kvw_prc;
  final double ppvz_sales_commission;
  final double ppvz_for_pay;
  final double ppvz_reward;
  final double ppvz_vw;
  final double ppvz_vw_nds;
  final int ppvz_office_id;
  final int ppvz_supplier_id;
  final String ppvz_supplier_name;
  final String ppvz_inn;
  final String declaration_number;
  final String sticker_id;
  final String site_country;
  final String img;

  factory Report.fromJson(Map<String, dynamic> json) {
    int nmID = json['nm_id'] ?? 0;
    String nmIDStr = nmID.toString();
    String part = nmID.toString().replaceRange(4, null, "0000");
    String img = 'https://images.wbstatic.net/big/new/$part/$nmIDStr-1.jpg';
    return Report(
      // date: json['date'] ?? "",
      realizationreportId: json['realizationreport_id'] ?? "",
      suppliercontractCode: json['suppliercontract_code'] ?? "",
      rrdId: json['rrd_id'] ?? 0,
      giId: json['gi_id'] ?? 0,
      subjectName: json['subject_name'] ?? "",
      nmId: json['nm_id'] ?? 0,
      brandName: json['brand_name'] ?? "",
      saName: json['sa_name'] ?? "",
      ts_name: json['ts_name'] ?? "",
      barcode: json['barcode'] ?? "",
      doc_type_name: json['doc_type_name'] ?? "",
      quantity: json['quantity'] ?? 0,
      retail_price: json['retail_price'].toDouble() ?? 0.0,
      retail_amount: json['retail_amount'].toDouble() ?? 0.0,
      sale_percent: json['sale_percent'].toDouble() ?? 0.0,
      commission_percent: json['commission_percent'].toDouble() ?? 0.0,
      office_name: json['office_name'] ?? "",
      supplier_oper_name: json['supplier_oper_name'] ?? "",
      order_dt: json['order_dt'] ?? "",
      sale_dt: json['sale_dt'] ?? "",
      rr_dt: json['rr_dt'] ?? "",
      shk_id: json['shk_id'] ?? 0,
      retail_price_withdisc_rub:
          json['retail_price_withdisc_rub'].toDouble() ?? 0.0,
      delivery_amount: json['delivery_amount'] ?? 0,
      return_amount: json['return_amount'] ?? 0,
      delivery_rub: json['delivery_rub'].toDouble() ?? 0.0,
      gi_box_type_name: json['gi_box_type_name'] ?? "",
      product_discount_for_report:
          json['product_discount_for_report'].toDouble() ?? 0.0,
      supplier_promo: json['supplier_promo'].toDouble() ?? 0.0,
      rid: json['rid'] ?? 0,
      ppvz_spp_prc: json['ppvz_spp_prc'].toDouble() ?? 0.0,
      ppvz_kvw_prc_base: json['ppvz_kvw_prc_base'].toDouble() ?? 0.0,
      ppvz_kvw_prc: json['ppvz_kvw_prc'].toDouble() ?? 0.0,
      ppvz_sales_commission: json['ppvz_sales_commission'].toDouble() ?? 0.0,
      ppvz_for_pay: json['ppvz_for_pay'].toDouble() ?? 0.0,
      ppvz_reward: json['ppvz_reward'].toDouble() ?? 0.0,
      ppvz_vw: json['ppvz_vw'].toDouble() ?? 0.0,
      ppvz_vw_nds: json['ppvz_vw_nds'].toDouble() ?? 0.0,
      ppvz_office_id: json['ppvz_office_id'] ?? 0,
      ppvz_supplier_id: json['ppvz_supplier_id'] ?? 0,
      ppvz_supplier_name: json['ppvz_supplier_name'] ?? "",
      ppvz_inn: json['ppvz_inn'] ?? "",
      declaration_number: json['declaration_number'] ?? "",
      sticker_id: json['sticker_id'] ?? "",
      site_country: json['site_country'] ?? "",

      img: img,
    );
  }

  Report({
    required this.realizationreportId,
    required this.suppliercontractCode,
    required this.rrdId,
    required this.giId,
    required this.subjectName,
    required this.nmId,
    required this.brandName,
    required this.saName,
    required this.ts_name,
    required this.barcode,
    required this.doc_type_name,
    required this.quantity,
    required this.retail_price,
    required this.retail_amount,
    required this.sale_percent,
    required this.commission_percent,
    required this.office_name,
    required this.supplier_oper_name,
    required this.order_dt,
    required this.sale_dt,
    required this.rr_dt,
    required this.shk_id,
    required this.retail_price_withdisc_rub,
    required this.delivery_amount,
    required this.return_amount,
    required this.delivery_rub,
    required this.gi_box_type_name,
    required this.product_discount_for_report,
    required this.supplier_promo,
    required this.rid,
    required this.ppvz_spp_prc,
    required this.ppvz_kvw_prc_base,
    required this.ppvz_kvw_prc,
    required this.ppvz_sales_commission,
    required this.ppvz_for_pay,
    required this.ppvz_reward,
    required this.ppvz_vw,
    required this.ppvz_vw_nds,
    required this.ppvz_office_id,
    required this.ppvz_supplier_id,
    required this.ppvz_supplier_name,
    required this.ppvz_inn,
    required this.declaration_number,
    required this.sticker_id,
    required this.site_country,
    required this.img,
  });
}
