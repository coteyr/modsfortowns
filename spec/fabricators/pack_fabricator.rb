Fabricator(:pack) do
  title { sequence(:name) {|i| "pack name #{i}" } }
  screenshot File.open(Rails.root.join('spec/fixtures/test.png'))
  user
end
