Fabricator(:version) do
  number '1'
  mod
  major_changes "stuff changed"
  download File.open(Rails.root.join('spec/fixtures/test.zip'))
end
