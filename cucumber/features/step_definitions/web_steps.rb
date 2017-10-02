Quando(/^acesso o sistema$/) do
  visit '/'
end

Então(/^vejo a região com o título "([^"]*)"$/) do |titulo|
  expect(page).to have_content titulo
end