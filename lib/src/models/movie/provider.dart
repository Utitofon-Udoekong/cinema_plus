class MovieProvider {
  final int id;
  final Map<String, ProviderResult> results;

  MovieProvider({required this.results, required this.id});

  factory MovieProvider.fromJson(Map<String, dynamic> json) {
    final movieId = json['id'];
    final Map<String, dynamic> providerMap =
        json['results'] as Map<String, dynamic>;
    final Map<String, ProviderResult> providers = {};
    providerMap.forEach((key, value) {
      providers[key] = ProviderResult.fromJson(value);
    });
    return MovieProvider(results: providers, id: movieId);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["results"] = results;
    return data;
  }
}

class ProviderResult {
  String link;
  List<ProviderInfo>? flatrate;
  List<ProviderInfo>? rent;
  List<ProviderInfo>? buy;

  ProviderResult({required this.link, this.flatrate, this.rent, this.buy});

  factory ProviderResult.fromJson(Map<String, dynamic> json) {
    final link = json['link'];
    List<ProviderInfo>? flatrate;
    List<ProviderInfo>? rent;
    List<ProviderInfo>? buy;
    if (json['flatrate'] != null) {
      json['flatrate'].forEach((v) {
        flatrate!.add(ProviderInfo.fromJson(v));
      });
    }
    if (json['rent'] != null) {
      json['rent'].forEach((v) {
        rent!.add(ProviderInfo.fromJson(v));
      });
    }
    if (json['buy'] != null) {
      json['buy'].forEach((v) {
        buy!.add(ProviderInfo.fromJson(v));
      });
    }
    return ProviderResult(
      link: link,
      flatrate: flatrate,
      rent: rent,
      buy: buy,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    if (flatrate != null) {
      data['flatrate'] = flatrate?.map((v) => v.toJson()).toList();
    }
    if (rent != null) {
      data['rent'] = rent?.map((v) => v.toJson()).toList();
    }
    if (buy != null) {
      data['buy'] = buy?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProviderInfo {
  String logoPath;
  int providerId;
  String providerName;
  int displayPriority;

  ProviderInfo({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  factory ProviderInfo.fromJson(Map<String, dynamic> json) {
    return ProviderInfo(
      logoPath: json['logo_path'],
      providerId: json['provider_id'],
      providerName: json['provider_name'],
      displayPriority: json['display_priority'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logo_path'] = logoPath;
    data['provider_id'] = providerId;
    data['provider_name'] = providerName;
    data['display_priority'] = displayPriority;
    return data;
  }
}
