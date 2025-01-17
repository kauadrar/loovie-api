case title
when MovieTranslation
  json.partial! "movie_translations/movie_translation", movie_translation: title
  json.title_type "movie"
when ShowTranslation
  json.partial! "show_translations/show_translation", show_translation: title
  json.title_type "show"
end
