class TitlesController < ApplicationController
  def index
    query = params[:query].present? ? params[:query] : "*"
    language_code = request.headers["accept-language"]

    @titles = Searchkick.search(query, models: [ MovieTranslation, ShowTranslation ], fields: [ "name^10", "overview" ], where: { language_code: }, limit: 20)

    if @titles.count < 4
      MultisearchJob.perform_async(query)
    end

    render "titles/index"
  end
end
