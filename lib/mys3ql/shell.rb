module Mys3ql
  class ShellCommandError < RuntimeError ; end

  module Shell
    def execute(command)
      log command
      result = `#{command}`
      log "==> #{result}"
      raise ShellCommandError, "error (exit status #{$?.exitstatus}): #{command} ==> #{result}: #{$?}" unless $?.success?
      result
    end

    def log(message)
      puts message if debugging?
    end

    def debugging?
      true
    end

  end
end