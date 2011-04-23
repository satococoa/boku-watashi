Fabricator(:wish) do
  child!
  cost Forgery::Basic.number(:at_least => 1000, :at_most => 50000)
  purpose Forgery::Basic.text
end
