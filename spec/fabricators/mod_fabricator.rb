Fabricator(:mod) do
  name { sequence(:name) {|i| "name #{i}" } }
  description "A mod for testing"
  user
end
