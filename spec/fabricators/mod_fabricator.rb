Fabricator(:mod) do
  name { sequence(:name) {|i| "name #{i}" } }
  description "A mod for testing"
  user
  category
  screenshot File.open(Rails.root.join('spec/fixtures/test.png'))
end
