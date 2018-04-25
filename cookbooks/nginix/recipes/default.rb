#
# Cookbook:: nginix
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#package 'nginx' do
#	action :upgrade
#end


service 'nginx' do
	action [:enable,:start]
end

file '/etc/motd' do
	content 'from default.rb ; testing notifies property'
	notifies :restart,'service[nginx]'
end

execute 'gen_hostname' do
	command '/usr/bin/hostname > /home/user/gen_hostname.txt'
	command 'systemctl status nginx|grep "running" >> /home/user/gen_hostname.txt'
	only_if 'test -z /home/user/gen_hostname.txt'
end
