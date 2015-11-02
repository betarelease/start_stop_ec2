require 'aws-sdk'

command = ARGV[0]
instance_id = ARGV[1]

ec2 = Aws::EC2::Client.new(region: 'us-east-1')

case command
when 'stop'
  puts "stopping instance #{instance_id}"
  response = ec2.stop_instances({
    instance_ids: [instance_id],
    force: true
  })
  puts "stopped instance #{instance_id}"
  puts "response => #{response.inspect}"

when 'start'
  puts "starting instance #{instance_id}"
  response = ec2.start_instances(
    instance_ids: [instance_id])
  puts "started instance #{instance_id}"
  puts "response => #{response.inspect}"

when 'status'
  response = ec2.describe_instance_status(
    instance_ids: [instance_id])
  puts "status of instance #{instance_id} : #{response.instance_statuses[0].instance_state.name}"
  puts "response => #{response.inspect}"

else
  puts 'no command specified'
end
