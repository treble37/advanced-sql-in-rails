Rails.application.routes.draw do
  mount EasterEgg.new, at: '/codd'
  mount Readme.new, at: '/'
end
