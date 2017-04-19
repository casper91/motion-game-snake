# -*- coding: utf-8 -*-

begin
  require 'bundler'
  Bundler.require(:default, :ios)
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake ios:config' to see complete project settings.
  app.name = 'Snake'
  app.identifier = 'dk.ccapps.cch'

  app.development do
    app.provisioning_profile = 'provision/xxyyzz.mobileprovision'
    app.codesign_certificate = 'iPhone Developer: xxyyzz'
  end
end
