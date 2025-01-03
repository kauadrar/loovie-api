module Tmdb
  class SeasonsService < TmdbService
    def get_episodes(tmdb_id)
      season = Season.find_by(tmdb_id:)
      response = @tmdb_api["/tv/#{season.show.tmdb_id}/season/#{season.number}?language=#{@language.code}"].get
      response_body = JSON.parse(response.body)

      puts "response_body: #{response_body}"

      tmdb_episodes = response_body["episodes"]

      tmdb_episodes.each do |tmdb_episode|
        next if Episode.exists?(tmdb_id: tmdb_episode["id"])

        episode = Episode.create(
          season:,
          tmdb_id: tmdb_episode["id"],
          number: tmdb_episode["episode_number"],
          still_path: tmdb_episode["still_path"],
          release_date: tmdb_episode["air_date"],
          duration: tmdb_episode["runtime"],
          vote_average: tmdb_episode["vote_average"],
          vote_count: tmdb_episode["vote_count"],
        )

        EpisodeTranslation.create(
          episode:,
          name: tmdb_episode["name"],
          overview: tmdb_episode["overview"],
        )
      end
    end
  end
end
