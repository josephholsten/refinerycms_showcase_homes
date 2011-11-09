require 'refinerycms-base'

module Refinery
  module ShowcaseHomes

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        ::Refinery::Plugin.register do |plugin|
          plugin.name = "showcase_homes"
          plugin.pathname = root
          plugin.hide_from_menu = false
          plugin.activity = {
            :class => ShowcaseHome,
            :title => 'address',
            :url_prefix => 'edit'
          }
        end
      end
    end
  end
end
