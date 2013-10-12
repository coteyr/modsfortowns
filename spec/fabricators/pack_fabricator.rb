Fabricator(:pack) do
  title { sequence(:name) {|i| "pack name #{i}" } }
  user
end
