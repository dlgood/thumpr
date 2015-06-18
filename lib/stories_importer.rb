class StoriesImporter
  def import
    Story.create(role: "Purchaser", goal: "Order extra cheese on half the pizza", benefit: "Cater to the people in my party who like a lot of cheese", fftext: "I have to convince these friends not to go to Papa Guido's")
    Story.create(role: "Driver", goal: "Mark order as delivered", benefit: "Prevent other drivers from delivering another pizza")
    Story.create(role: "Manager", goal: "See monthly revenue  numbers", benefit: "Make better staffing decisions")
  end
end
