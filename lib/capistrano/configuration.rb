<<<<<<< HEAD
require 'capistrano/logger'

require 'capistrano/configuration/alias_task'
require 'capistrano/configuration/callbacks'
require 'capistrano/configuration/connections'
require 'capistrano/configuration/execution'
require 'capistrano/configuration/loading'
require 'capistrano/configuration/log_formatters'
require 'capistrano/configuration/namespaces'
require 'capistrano/configuration/roles'
require 'capistrano/configuration/servers'
require 'capistrano/configuration/variables'

require 'capistrano/configuration/actions/file_transfer'
require 'capistrano/configuration/actions/inspect'
require 'capistrano/configuration/actions/invocation'

module Capistrano
  # Represents a specific Capistrano configuration. A Configuration instance
  # may be used to load multiple recipe files, define and describe tasks,
  # define roles, and set configuration variables.
  class Configuration
    # The logger instance defined for this configuration.
    attr_accessor :debug, :logger, :dry_run, :preserve_roles

    def initialize(options={}) #:nodoc:
      @debug = false
      @dry_run = false
      @preserve_roles = false
      @logger = Logger.new(options)
    end

    # make the DSL easier to read when using lazy evaluation via lambdas
    alias defer lambda

    # The includes must come at the bottom, since they may redefine methods
    # defined in the base class.
    include AliasTask, Connections, Execution, Loading, LogFormatters, Namespaces, Roles, Servers, Variables

    # Mix in the actions
    include Actions::FileTransfer, Actions::Inspect, Actions::Invocation

    # Must mix last, because it hooks into previously defined methods
    include Callbacks

    (self.instance_methods & Kernel.methods).select do |name|
      # Select the instance methods owned by the Configuration class.
      self.instance_method(name).owner.to_s.start_with?("Capistrano::Configuration")
    end.select do |name|
      # Of those, select methods that are being shadowed by the Kernel module in the Namespace class.
      Namespaces::Namespace.method_defined?(name) && Namespaces::Namespace.instance_method(name).owner == Kernel
    end.each do |name|
      # Undefine the shadowed methods, since we want Namespace objects to defer handling to the Configuration object.
      Namespaces::Namespace.send(:undef_method, name)
    end
=======
require_relative 'configuration/question'
require_relative 'configuration/servers'
require_relative 'configuration/server'

module Capistrano
  class Configuration

    class << self
      def env
        @env ||= new
      end

      def reset!
        @env = new
      end
    end

    def ask(key, default=nil, options={})
      question = Question.new(self, key, default, options)
      set(key, question)
    end

    def set(key, value)
      config[key] = value
    end

    def delete(key)
      config.delete(key)
    end

    def fetch(key, default=nil, &block)
      value = fetch_for(key, default, &block)
      while callable_without_parameters?(value)
        value = set(key, value.call)
      end
      return value
    end

    def keys
      config.keys
    end

    def role(name, hosts, options={})
      if name == :all
        raise ArgumentError.new("#{name} reserved name for role. Please choose another name")
      end

      servers.add_role(name, hosts, options)
    end

    def server(name, properties={})
      servers.add_host(name, properties)
    end

    def roles_for(names)
      servers.roles_for(names)
    end

    def primary(role)
      servers.fetch_primary(role)
    end

    def backend
      @backend ||= SSHKit
    end

    attr_writer :backend

    def configure_backend
      backend.configure do |sshkit|
        sshkit.format           = fetch(:format)
        sshkit.output_verbosity = fetch(:log_level)
        sshkit.default_env      = fetch(:default_env)
        sshkit.backend          = fetch(:sshkit_backend, SSHKit::Backend::Netssh)
        sshkit.backend.configure do |backend|
          backend.pty                = fetch(:pty)
          backend.connection_timeout = fetch(:connection_timeout)
          backend.ssh_options        = fetch(:ssh_options) if fetch(:ssh_options)
        end
      end
    end

    def timestamp
      @timestamp ||= Time.now.utc
    end

    private

    def servers
      @servers ||= Servers.new
    end

    def config
      @config ||= Hash.new
    end

    def fetch_for(key, default, &block)
      if block_given?
        config.fetch(key, &block)
      else
        config.fetch(key, default)
      end
    end

<<<<<<< HEAD
>>>>>>> 8f436569fbbf55b246a385a1514f8bca85b28e13
=======
    def callable_without_parameters?(x)
      x.respond_to?(:call) && ( !x.respond_to?(:arity) || x.arity == 0)
    end
>>>>>>> e63eda7a0f08a1ad80ad11d5f6073aa612aae233
  end
end
