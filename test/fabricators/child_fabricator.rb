Fabricator(:child) do
  childname Forgery::Internet.user_name
  nickname Forgery::Name.first_name
  password 'password'
  password_confirmation 'password'
end

Fabricator(:childwithuser, :from => :child) do
  user!
end
