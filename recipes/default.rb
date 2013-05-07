
include_recipe "git"

node['dotfiles']['users'].each do |user,config|
  dotfiles_dir = "#{node['etc']['passwd'][user]['dir']}/dotfiles"
  
  directory dotfiles_dir do
    owner user
    group user
    recursive true
  end
  
  git dotfiles_dir do
    repository config['repo']
    reference (config['ref'] || 'master')
    user user
    group user
    action :sync
  end

  execute "#{dotfiles_dir}/configure.sh" do
    command "sudo -H -u #{user} #{dotfiles_dir}/configure.sh"
  end
end
