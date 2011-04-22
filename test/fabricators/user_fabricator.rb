Fabricator(:user) do
  email Forgery::Internet.email_address
  password 'password'
  password_confirmation 'password'
end
