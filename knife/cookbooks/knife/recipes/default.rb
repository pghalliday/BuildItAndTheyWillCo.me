include_recipe "git"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
rbenv_ruby "1.9.3-p448"
rbenv_gem "bundler" do
  ruby_version "1.9.3-p448"
end
magic_shell_environment 'EDITOR' do
  value 'nano'
end
