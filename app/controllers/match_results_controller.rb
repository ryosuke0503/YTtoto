class MatchResultsController < ApplicationController
  before_action :set_match_result, only: %i[ show edit update destroy ]

  # GET /match_results or /match_results.json
  def index
    @match_results = MatchResult.all
  end

  # GET /match_results/1 or /match_results/1.json
  def show
  end

  # GET /match_results/new
  def new
    @match_result = MatchResult.new
  end

  # GET /match_results/1/edit
  def edit
  end

  # POST /match_results or /match_results.json
  def create
    @match_result = MatchResult.new(match_result_params)

    respond_to do |format|
      if @match_result.save
        format.html { redirect_to @match_result, notice: "Match result was successfully created." }
        format.json { render :show, status: :created, location: @match_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /match_results/1 or /match_results/1.json
  def update
    respond_to do |format|
      if @match_result.update(match_result_params)
        format.html { redirect_to @match_result, notice: "Match result was successfully updated." }
        format.json { render :show, status: :ok, location: @match_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_results/1 or /match_results/1.json
  def destroy
    @match_result.destroy
    respond_to do |format|
      format.html { redirect_to match_results_url, notice: "Match result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    logger.debug("import CSV file!!!")
    file=params[:file] #受け取ったCSVファイル
    CSV.foreach(file.path, headers: true) do |row|
      #一行ずつ取り出し生徒を作成
      matchresult = MatchResult.new(
        year: row["year"],
        league: row["league"],
        kind: row["kind"],
        date: row["date"],
        time: row["time"],
        home_id: Team.find_by(name: row["home"]).id,
        homescore: row["homescore"],
        awayscore: row["awayscore"],
        away_id: Team.find_by(name: row["away"]).id,
        stadium: row["stadium"],
        viewers: row["viewers"],
        broadcasts: row["broadcasts"]
      )
      if matchresult.save
        flash[:notice]="チームを追加できました"
        logger.debug("チームを追加できました")
      else
        flash[:alert]="チームを追加できませんでした"
        logger.debug("チームを追加できませんでした")
      end
    end
    redirect_to match_results_url
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_result
      @match_result = MatchResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_result_params
      params.require(:match_result).permit(:year, :league, :kind, :date, :time, :home_id, :homescore, :awayscore, :away_id, :stadium, :viewers, :broadcasts)
    end
end
