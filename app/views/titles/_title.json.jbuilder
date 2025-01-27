require "ostruct"

case title["type"]
when "movie"
  json.partial! "movie_translations/movie_translation", movie_translation: OpenStruct.new(title)
  json.title_type "movie"
when "show"
  json.partial! "show_translations/show_translation", show_translation: OpenStruct.new(title)
  json.title_type "show"
end
