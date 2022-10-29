class ModelApi {
  ModelApi({
    this.state,
    this.capital,
  });

  String state;
  String capital;

  factory ModelApi.fromJson(Map<String, dynamic> json) => ModelApi(
    state: json["state"],
    capital: json["capital"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "capital": capital,
  };
}