require 'redmine'

Redmine::Scm::Base.add 'GitRemote'

Redmine::Plugin.register :redmine_git_remote do
  name 'Redmine Git Remote'
  author 'Alex Dergachev'
  url 'https://github.com/lafriks/redmine_git_remote'
  description 'Automatically clone and fetch remote git repositories'
  version '0.0.3'

  PLUGIN_ROOT = Pathname.new(__FILE__).join('..').realpath.to_s
  options = YAML::load( File.open(File.join(PLUGIN_ROOT + '/config', 'settings.yml')))

  settings :default => {'git_local_path_default' => options['git_local_path'],
                        'git_remote_url_prefix_default' => options['git_remote_url_prefix'],
                        'delete_unused_repo_from_disk' => options['delete_unused_repo_from_disk']},
                        :partial => 'settings/redmine_git_remote'
end

require_relative 'after_init'
