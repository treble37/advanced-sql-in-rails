desc "Open the Exercise.pdf"
task :open do
  sh("open docs/exercise.pdf")
end

task run: :environment do
  puts Statistics.triple_crown_winner(2012, 'AL')
  puts
  puts Statistics.most_improved_batting_average(2009, 2010)
  puts
  puts "Slugging Percentage Team Stats (limiting to top 10)..."
  puts
  puts Statistics.slugging_percentage(2007, 'OAK')
end

task explain: :environment do
  puts "Explain triple crown winner:"
  puts
  puts TripleCrownQuery.new(2012, 'AL').explain
  puts
  puts "Explain most improved batting average:"
  puts
  puts MostImprovedBattingAverageQuery.new(2009, 2010).explain
  puts
  puts "Explain slugging percentage:"
  puts
  puts SluggingPercentageQuery.new(2007, 'OAK').explain
end
