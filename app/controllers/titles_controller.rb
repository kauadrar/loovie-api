class TitlesController < ApplicationController
  def index
    query = params[:query].present? ? params[:query] : "*"
    language_code = request.headers["accept-language"]

    @titles = Searchkick.search(query, models: [ MovieTranslation, ShowTranslation ], fields: [ "name^10", "original_name^5", "overview" ], where: { language_code: }, limit: 21, load: false, order: { vote_count: :desc })

    if @titles.count < 4
      MultisearchJob.perform_async(query)
    end

    render "titles/index"
  end

  def autocomplete
    query = params[:query]
    language_code = request.headers["accept-language"]

    @titles = Searchkick.search(query, models: [ MovieTranslation, ShowTranslation ], fields: [ "name^10", "original_name" ], where: { language_code: }, misspellings: false, load: false, limit: 10, match: :word_start, order: { vote_count: :desc })

    titles_autocomplete = @titles.map do |t|
      t["name"].downcase.include?(query) ? t["name"] : t["original_name"].downcase.include?(query) ? t["original_name"] : nil
    end.compact.map(&:downcase).uniq

    render json: titles_autocomplete, status: :ok
  end
end
