# Welcome message after login to server

file '/etc/motd' do
	content 'server packages - postgresql,nginx'
	#content 'check if it appends'
end
