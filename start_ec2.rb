require 'aws-sdk'

command = ARGV[0]
instance_id = ARGV[1]

ec2 = Aws::EC2::Client.new(region: 'us-east-1')
case command
when 'stop'
puts "[DEBUG] stopping instance #{instance_id}"
response = ec2.stop_instances({
  instance_ids: [instance_id],
  force: true
})
puts"[DEBUG] stopped instance #{instance_id}"
puts "[DEBUG] response => #{response.inspect}"

when 'start'
puts "[DEBUG] starting instance #{instance_id}"
response = ec2.start_instances({
  instance_ids: [instance_id]
})
puts "[DEBUG] started instance #{instance_id}"
puts "[DEBUG] response => #{response.inspect}"

else
  puts"[DEBUG] no command specified"
end
