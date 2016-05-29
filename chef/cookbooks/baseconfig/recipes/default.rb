# Make sure the Apt package lists are up to date, so we're downloading versions that exist.
cookbook_file "apt-sources.list" do
  path "/etc/apt/sources.list"
end
execute 'apt_update' do
  command 'apt-get update'
end

# Base configuration recipe in Chef.
package "ntp"
cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end
execute 'ntp_restart' do
  command 'service ntp restart'
end

execute 'ruby_install' do
	command 'apt-get install ruby-full -y'
end

execute 'heroku cli install' do
	command 'wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh'
end
