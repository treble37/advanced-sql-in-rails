desc "Open the Exercise.pdf"
task :open do
  sh("open docs/exercise.pdf")
end

task run: :environment do
  puts Statistics.triple_crown_winner(2012, 'AL')
  puts Statistics.most_improved_batting_average(2009, 2010)
end
