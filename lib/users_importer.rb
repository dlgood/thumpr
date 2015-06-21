class UsersImporter
  def import
    User.create(name: 'Andrew Hayter', email: 'ahayter@gmail.com', password: 'password', team_id: 1)
    User.create(name: 'Dave Good', email: 'dgood@gmail.com', password: 'password', team_id: 1)
    User.create(name: 'Brandon Huang', email: 'bhuang@gmail.com', password: 'password', team_id: 1)
    User.create(name: 'Don Burks', email: 'dburks@lighthouselabs.ca', password: 'password', team_id: 1)
    User.create(name: 'Khurram Virani', email: 'khurrum@lighthouselabs.ca', password: 'password', team_id: 1)
    User.create(name: 'Monica O', email: 'mmonica@lighthouselabs.ca', password: 'password', team_id: 1)
  end
end
