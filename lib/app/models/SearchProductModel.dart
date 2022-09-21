import 'dart:convert';

List<SearchProductModel> searchProductModelFromJson(String str) =>
    List<SearchProductModel>.from(
        json.decode(str).map((x) => SearchProductModel.fromJson(x)));

String searchProductModelToJson(List<SearchProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<SearchProductModel> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<SearchProductModel>((json) => SearchProductModel.fromJson(json))
      .toList();
}

class SearchProductModel {
  final int? id;
  final Brand? brand;
  final String? image;
  final Charge? charge;
  final List<Images>? images;
  final String? slug;
  final String? productName;
  final String? model;
  final String? commissionType;
  final String? amount;
  final String? tag;
  final String? description;
  final String? note;
  final String? embaddedVideoLink;
  final int? maximumOrder;
  final int? stock;
  final bool? isBackOrder;
  final String? specification;
  final String? warranty;
  final bool? preOrder;
  final int? productReview;
  final bool? isSeller;
  final bool? isPhone;
  final bool? willShowEmi;
  final dynamic badge;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final dynamic language;
  final String? seller;
  final dynamic combo;
  final String? createdBy;
  final dynamic updatedBy;
  final List<int>? category;
  final List<dynamic>? relatedProduct;
  final List<dynamic>? filterValue;

  SearchProductModel({
    this.id,
    this.brand,
    this.image,
    this.charge,
    this.images,
    this.slug,
    this.productName,
    this.model,
    this.commissionType,
    this.amount,
    this.tag,
    this.description,
    this.note,
    this.embaddedVideoLink,
    this.maximumOrder,
    this.stock,
    this.isBackOrder,
    this.specification,
    this.warranty,
    this.preOrder,
    this.productReview,
    this.isSeller,
    this.isPhone,
    this.willShowEmi,
    this.badge,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.language,
    this.seller,
    this.combo,
    this.createdBy,
    this.updatedBy,
    this.category,
    this.relatedProduct,
    this.filterValue,
  });

  SearchProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        brand = (json['brand'] as Map<String, dynamic>?) != null
            ? Brand.fromJson(json['brand'] as Map<String, dynamic>)
            : null,
        image = json['image'] as String?,
        charge = (json['charge'] as Map<String, dynamic>?) != null
            ? Charge.fromJson(json['charge'] as Map<String, dynamic>)
            : null,
        images = (json['images'] as List?)
            ?.map((dynamic e) => Images.fromJson(e as Map<String, dynamic>))
            .toList(),
        slug = json['slug'] as String?,
        productName = json['product_name'] as String?,
        model = json['model'] as String?,
        commissionType = json['commission_type'] as String?,
        amount = json['amount'] as String?,
        tag = json['tag'] as String?,
        description = json['description'] as String?,
        note = json['note'] as String?,
        embaddedVideoLink = json['embadded_video_link'] as String?,
        maximumOrder = json['maximum_order'] as int?,
        stock = json['stock'] as int?,
        isBackOrder = json['is_back_order'] as bool?,
        specification = json['specification'] as String?,
        warranty = json['warranty'] as String?,
        preOrder = json['pre_order'] as bool?,
        productReview = json['product_review'] as int?,
        isSeller = json['is_seller'] as bool?,
        isPhone = json['is_phone'] as bool?,
        willShowEmi = json['will_show_emi'] as bool?,
        badge = json['badge'],
        isActive = json['is_active'] as bool?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        language = json['language'],
        seller = json['seller'] as String?,
        combo = json['combo'],
        createdBy = json['created_by'] as String?,
        updatedBy = json['updated_by'],
        category =
            (json['category'] as List?)?.map((dynamic e) => e as int).toList(),
        relatedProduct = json['related_product'] as List?,
        filterValue = json['filter_value'] as List?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': brand?.toJson(),
        'image': image,
        'charge': charge?.toJson(),
        'images': images?.map((e) => e.toJson()).toList(),
        'slug': slug,
        'product_name': productName,
        'model': model,
        'commission_type': commissionType,
        'amount': amount,
        'tag': tag,
        'description': description,
        'note': note,
        'embadded_video_link': embaddedVideoLink,
        'maximum_order': maximumOrder,
        'stock': stock,
        'is_back_order': isBackOrder,
        'specification': specification,
        'warranty': warranty,
        'pre_order': preOrder,
        'product_review': productReview,
        'is_seller': isSeller,
        'is_phone': isPhone,
        'will_show_emi': willShowEmi,
        'badge': badge,
        'is_active': isActive,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'language': language,
        'seller': seller,
        'combo': combo,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'category': category,
        'related_product': relatedProduct,
        'filter_value': filterValue
      };
}

class Brand {
  final String? name;
  final String? image;
  final dynamic headerImage;
  final String? slug;

  Brand({
    this.name,
    this.image,
    this.headerImage,
    this.slug,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        image = json['image'] as String?,
        headerImage = json['header_image'],
        slug = json['slug'] as String?;

  Map<String, dynamic> toJson() =>
      {'name': name, 'image': image, 'header_image': headerImage, 'slug': slug};
}

class Charge {
  final double? bookingPrice;
  final double? currentCharge;
  final dynamic discountCharge;
  final double? sellingPrice;
  final double? profit;
  final bool? isEvent;
  final dynamic eventId;
  final bool? highlight;
  final dynamic highlightId;
  final bool? groupping;
  final dynamic grouppingId;
  final dynamic campaignSectionId;
  final bool? campaignSection;
  final dynamic message;

  Charge({
    this.bookingPrice,
    this.currentCharge,
    this.discountCharge,
    this.sellingPrice,
    this.profit,
    this.isEvent,
    this.eventId,
    this.highlight,
    this.highlightId,
    this.groupping,
    this.grouppingId,
    this.campaignSectionId,
    this.campaignSection,
    this.message,
  });

  Charge.fromJson(Map<String, dynamic> json)
      : bookingPrice = json['booking_price'] as double?,
        currentCharge = json['current_charge'] as double?,
        discountCharge = json['discount_charge'],
        sellingPrice = json['selling_price'] as double?,
        profit = json['profit'] as double?,
        isEvent = json['is_event'] as bool?,
        eventId = json['event_id'],
        highlight = json['highlight'] as bool?,
        highlightId = json['highlight_id'],
        groupping = json['groupping'] as bool?,
        grouppingId = json['groupping_id'],
        campaignSectionId = json['campaign_section_id'],
        campaignSection = json['campaign_section'] as bool?,
        message = json['message'];

  Map<String, dynamic> toJson() => {
        'booking_price': bookingPrice,
        'current_charge': currentCharge,
        'discount_charge': discountCharge,
        'selling_price': sellingPrice,
        'profit': profit,
        'is_event': isEvent,
        'event_id': eventId,
        'highlight': highlight,
        'highlight_id': highlightId,
        'groupping': groupping,
        'groupping_id': grouppingId,
        'campaign_section_id': campaignSectionId,
        'campaign_section': campaignSection,
        'message': message
      };
}

class Images {
  final int? id;
  final String? image;
  final bool? isPrimary;
  final int? product;

  Images({
    this.id,
    this.image,
    this.isPrimary,
    this.product,
  });

  Images.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        image = json['image'] as String?,
        isPrimary = json['is_primary'] as bool?,
        product = json['product'] as int?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'image': image, 'is_primary': isPrimary, 'product': product};
}
