Fabricator(:user) do
  name { sequence(:name) {|i| "name #{i}" } }
  email { sequence(:email) {|i| "some#{i}@email.com" } }
  password "apassword1"
  password_confirmation "apassword1"
end
