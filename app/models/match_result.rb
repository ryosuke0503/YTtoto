class MatchResult < ApplicationRecord
  belongs_to :team, optional: true
end
