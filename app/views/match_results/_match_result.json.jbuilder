json.extract! match_result, :id, :year, :league, :kind, :date, :time, :home_id, :homescore, :awayscore, :away_id, :stadium, :viewers, :broadcasts, :created_at, :updated_at
json.url match_result_url(match_result, format: :json)
