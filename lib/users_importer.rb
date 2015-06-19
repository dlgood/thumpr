class UsersImporter
  def import
    User.create(name: 'Andrew Hayter', email: 'ahayter@gmail.com', password: 'password', team_id: 1)
    User.create(name: 'Dave Good', email: 'dgood@gmail.com', password: 'password', team_id: 3)
    User.create(name: 'Brandon Huang', email: 'bhuang@gmail.com', password: 'password', team_id: 2)
  end
end
