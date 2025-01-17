class TitlesController < ApplicationController
  def index
    query = params[:query].present? ? params[:query] : "*"
    language_code = request.headers["accept-language"]

    @titles = Searchkick.search(query, models: [ MovieTranslation, ShowTranslation ], fields: [ "name^10", "overview" ], where: { language_code: })

    render "titles/index"
  end
end
