//= require Markdown.Converter
//= require Markdown.Editor
//= require Markdown.Extra
//= require Markdown.local.zh.js
//= require Markdown.Sanitizer
//

(function () {
  var converter = Markdown.getSanitizingConverter();
  converter.hooks.chain('preBlockGamut', function(text, rbg) {
    return text.replace(/^ {0,3}""" *\n((?:.*?\n)+?) {0,3}""" *$/gm,
      function (whole, inner) {
        return "<blockquote>" + rbg(inner) + '</blockquote>\n';
    });
  });

  var editor = new Markdown.Editor(converter, null, {strings: Markdown.local.zh});
  editor.run();
})();
