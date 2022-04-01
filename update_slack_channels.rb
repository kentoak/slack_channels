require 'json'

if ARGV[0].empty?
  puts "API Token is Empty :'-("
else
  response = `curl -X POST -H "Authorization: Bearer #{ARGV[0]}" "https://slack.com/api/conversations.list"`
  #xoxp-825280440711-825633548534-3317816127892-478f8ce99ac6599e3b88870b8e07e57e
  puts JSON.parse(response)
  if JSON.parse(response)['ok']
    File.write('channels.cache', response)
    puts 'Updated Slack Channels List :)'
  else
    puts "API Token is Invalid :'-("
  end
end
