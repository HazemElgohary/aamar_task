// ignore_for_file: constant_identifier_names

enum PasswordStatus {
  notSet,
  inCorrect,
  correct,
}

enum SocialMediaEnum {
  website,
  Facebook,
  Twitter,
  Instagram,
  WhatsApp,
  phone,
  email,
}

enum WeekEnum {
  Saturday,
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
}

enum ReasonEnum {
  private,
  delivery,
  maintenance,
  other,
}

enum PermissionEnum {
  full_control,
  products,
  orders,
  customer_service,
  financial,
  marketing,
}

enum PaymentType {
  bank,
  credit,
  phoneCash,
}

enum CreateProductStepEnum {
  photos,
  productDetails,
  inventoryPricing,
  delivery,
  translation,
}

enum QuestionTypeEnum {
  selectOne,
  short,
  long,
  multipleChoice,
  singleChoice,
}

enum VariationsTypeEnum {
  dropMenu,
  input,
}

enum AccessType {
  owner,
  full_control,
  manager,
  employee,
}

enum Status {
  public,
  private,
}

enum UploadStatus {
  waiting,
  acceptable,
  rejected,
}

enum ProductStatus {
  pending,
  acceptable,
  rejected,
}

enum OrdersDeliveryStatus {
  pending,
  accepted,
  in_progress,
  under_delivery,
  shipping_company_received,
  being_shipped,
  delivered,
  returned,
  partially_disabled,
  cancelled_shipping,
  full_disabled,
  cancelled_user,
  cancelled_shop,
}

enum OrderStatus {
  pending,
  accepted,
  in_progress,
  under_delivery,
}

enum OrderStatusShipping {
  shipping_company_received,
  being_shipped,
  delivered,
}

enum OrderStatusDisabled {
  partially_disabled,
  full_disabled,
}

enum OrderStatusCancelled {
  cancelled_shipping,
  cancelled_user,
  cancelled_shop,
}

enum LanguagesEnum {
  English,
  Arabic,
  Chinese,
  German,
  French,
}
