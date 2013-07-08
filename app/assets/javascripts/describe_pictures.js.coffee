jQuery ->
  $("#describe_picture_pictogramme_tokens").tokenInput "/pictogrammes.json",
    crossDomain: false
    prePopulate: $("#describe_picture_pictogramme_tokens").data("pre")
    theme: "facebook"
    tokenLimit: 3