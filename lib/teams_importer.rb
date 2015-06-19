class TeamsImporter
  def import
    Team.create(team_name: "Garage Sale Finder")
    Team.create(team_name: "Ask Chris")
    Team.create(team_name: "$%^^&@! My Landlord")
  end
end