class UsersImporter
  def import
    User.create(name: 'Andrew Hayter', email: 'ahayter@gmail.com', password: 'password')
    User.create(name: 'Dave Good', email: 'dgood@gmail.com', password: 'password')
    User.create(name: 'Brandon Huang', email: 'bhuang@gmail.com', password: 'password')
  end
end
