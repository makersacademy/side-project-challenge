var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://api.meaningcloud.com/sentiment-2.1",
  "method": "POST",
  "headers": {
    "content-type": "application/x-www-form-urlencoded"
  },
  "data": {
    "key": "b828310c0da942cdbf2bd51c3e95186e",
    "lang": "en",
    "txt": "When pressed by Today presenter Nick Robinson on what evidence there was to suggest European nations would compromise on such issues as freedom of movement, Mr Blair said:",
    "txtf": "plain"
  }
};

var resp;
$.ajax(settings).done(function (response) {
  $("#agreement").text(response.agreement.toLowerCase());
  $("#confidence").text(response.confidence.toLowerCase());
  $("#irony").text(response.irony.toLowerCase());
  $("#score-tag").text(response.score_tag.toLowerCase());
  $("#subjectivity").text(response.subjectivity.toLowerCase());
});
