class TeamsController < ActionController::Base
    def index
        @teams = Team.all
    end
    def show
        @team = Team.find(params["id"])
    end
    def new
        @team = Team.new
    end
    def create
        @team = Team.create(team_params)
        redirect_to teams_path
    end
    def edit
        @team = Team.find(params[:id])
    end
    
    def update
        @team = Team.find(params[:id])
        @team.update(team_params)
        redirect_to teams_path
    end
    def destroy
        @team = Team.find(params[:id])
        logger.debug("destroy team!!!")
        logger.debug(@team)
        @team.destroy
        redirect_to teams_path
    end
    def import
        file=params[:file] #受け取ったCSVファイル
        CSV.foreach(file.path, headers: true) do |row|
          #一行ずつ取り出し生徒を作成
          team = Team.new(
            name: row["name"]
          )
          if team.save
            flash[:notice]="チームを追加できました"
          else
            flash[:alert]="チームを追加できませんでした"
          end
        end
        redirect_to teams_url
    end

    private
    def team_params
      params.require(:team).permit(:name)
    end
end