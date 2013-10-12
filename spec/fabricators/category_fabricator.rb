Fabricator(:category) do
  name { sequence(:name) {|i| "name #{i}" } }
  description "holds stuff"
end
