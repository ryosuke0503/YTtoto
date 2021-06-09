class CreateMatchResults < ActiveRecord::Migration[6.1]
  def change
    create_table :match_results do |t|
      t.integer :year
      t.string :league
      t.string :kind
      t.string :date
      t.string :time
      t.references :home
      t.integer :homescore
      t.integer :awayscore
      t.references :away
      t.string :stadium
      t.integer :viewers
      t.string :broadcasts

      t.timestamps
    end

    add_foreign_key :match_results, :teams, column: :home_id
    add_foreign_key :match_results, :teams, column: :away_id
  end
end
