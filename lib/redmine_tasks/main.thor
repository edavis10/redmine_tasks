# module: redmine_tasks

module RedmineTasks
  class Base < Thor
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end
  end

  class PluginInstall < Base
    desc "install_from_file", "Install a Redmine plugin from file"
    def install_from_file(plugin_name)

      dir = "/home/edavis/dev/redmine/plugins/#{plugin_name}"
      if File.exists?(dir)
        directory(dir, plugin_name)
        # TODO: thor misses .git
        directory(dir + "/.git", plugin_name + "/.git")
      else
        raise "No such file or directory - #{dir}"
      end
    end
  end
end


