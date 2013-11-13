object false

child(@episodes) do
  extends "episodes/episode"
end

node(:page_number) {|m| params[:page] || 1 }
node(:total_pages) {|m| @episodes.total_pages }
