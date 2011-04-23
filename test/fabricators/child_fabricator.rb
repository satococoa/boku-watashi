Fabricator(:child) do
  childname Forgery::Internet.user_name
  nickname Forgery::Name.first_name
  pocket Forgery::Basic.number(:at_least => 1000, :at_most => 50000)
  password 'password'
  password_confirmation 'password'
end

Fabricator(:child2, :from => :child) do
  childname Forgery::Internet.user_name
  nickname Forgery::Name.first_name
  pocket Forgery::Basic.number(:at_least => 1000, :at_most => 50000)
end

Fabricator(:childwithuser, :from => :child) do
  user!
end
