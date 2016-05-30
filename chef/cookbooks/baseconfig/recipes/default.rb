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

execute 'Installing dependencies' do
	command 'apt-get install build-essential libgdbm-dev libncurses5-dev automake libtool bison libffi-dev git libmysqlclient-dev -y'
end

execute 'Download Huginn' do
	cwd '/home/vagrant/project/'
	command 'git clone git://github.com/cantino/huginn.git'
	not_if {::Dir.exists?('/home/vagrant/project/huginn/')} 
end

execute '...continuing dependency installations...' do
	command 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
end

# execute 'Installing RVM' do
# 	command 'curl -sSL https://get.rvm.io | bash -s stable'
# end

execute 'Installing Ruby' do
	command 'sudo apt-get install ruby-dev -y'
	# command 'rvm install 2.3.1'
end

execute 'heroku cli install' do
	command 'wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh'
end

execute 'gem rake and bundler install' do
	command 'gem install rake bundler mysql2'
end

execute 'Huginn Config' do
	cwd '/home/vagrant/project/'
	command 'sudo ./huginnConf.sh'
end

execute 'NodeJS Source Installation' do
	command 'curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -'
end

execute 'Installing NodeJS' do
	command 'sudo apt-get install -y nodejs'
end

package 'rails'

execute 'Removing packages that are no longer required' do
	command 'sudo apt-get autoremove -y'
end
