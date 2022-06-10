import 'dart:convert';

List<CustomerModel> decodeCustomerModel(String str) => List<CustomerModel>.from(
    json.decode(str).map((x) => CustomerModel.fromJson(x)));

class CustomerModel {
  CustomerModel({
    required this.vendorId,
    required this.vendorName,
    required this.isActive,
    required this.mobileNo,
    required this.emailId,
    required this.gstno,
    required this.createdBy,
    required this.createdDate,
    required this.updatedBy,
    required this.updatedDate,
    required this.millName,
    required this.companyName,
    required this.companyAddress,
    required this.location,
    required this.contactPersonName,
    required this.contactPersonEmailId,
    required this.contactPersonMobileNo,
    required this.margin,
    required this.latitude,
    required this.longitude,
    required this.isDeleted,
    required this.password,
    required this.vendorType,
    required this.area,
    required this.yourLocation,
    required this.oneSignalId,
  });

  int vendorId;
  String vendorName;
  bool isActive;
  String mobileNo;
  String emailId;
  String gstno;
  String createdBy;
  DateTime createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  dynamic millName;
  dynamic companyName;
  String companyAddress;
  dynamic location;
  String contactPersonName;
  dynamic contactPersonEmailId;
  dynamic contactPersonMobileNo;
  double margin;
  dynamic latitude;
  dynamic longitude;
  bool isDeleted;
  String password;
  String vendorType;
  int area;
  String yourLocation;
  String oneSignalId;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        vendorId: json["VendorId"],
        vendorName: json["VendorName"] ?? "",
        isActive: json["IsActive"],
        mobileNo: json["MobileNo"],
        emailId: json["EmailId"],
        gstno: json["GSTNO"] ?? '',
        createdBy: json["CreatedBy"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        updatedBy: json["UpdatedBy"],
        updatedDate: json["UpdatedDate"],
        millName: json["MillName"] ?? "",
        companyName: json["CompanyName"] ?? "",
        companyAddress: json["CompanyAddress"] ?? "",
        location: json["Location"] ?? "",
        contactPersonName: json["ContactPersonName"] ?? '',
        contactPersonEmailId: json["ContactPersonEmailId"] ?? "",
        contactPersonMobileNo: json["ContactPersonMobileNo"] ?? "",
        margin: json["Margin"],
        latitude: json["Latitude"] ?? "",
        longitude: json["Longitude"] ?? "",
        isDeleted: json["IsDeleted"],
        password: json["Password"],
        vendorType: json["VendorType"],
        area: json["Area"] ?? 0,
        yourLocation: json["Your_Location"] ?? "",
        oneSignalId: json["ONE_SIGNAL_ID"] ?? '',
      );
}
