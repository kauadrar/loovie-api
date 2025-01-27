class TitlesController < ApplicationController
  def index
    query = params[:query].present? ? params[:query] : "*"
    language_code = request.headers["accept-language"]

    @titles = Searchkick.search(query, models: [ MovieTranslation, ShowTranslation ], fields: [ "name^10", "overview" ], where: { language_code: }, limit: 21, load: false)

    if @titles.count < 4
      MultisearchJob.perform_async(query)
    end

    render "titles/index"
  end

  def autocomplete
    language_code = request.headers["accept-language"]

    @titles = Searchkick.search(params[:query], models: [ MovieTranslation, ShowTranslation ], fields: [ :name ], where: { language_code: language_code }, misspellings: false, load: false, limit: 10, match: :word_start)

    render json: @titles.map { |t| t["name"] }.map(&:downcase).uniq, status: :ok
  end
end
