# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bistro_car}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jonas Nicklas"]
  s.date = %q{2010-03-09}
  s.description = %q{BistroCar serves up {CoffeeScript}[http://jashkenas.github.com/coffee-script/]
from within your Rails application.}
  s.email = ["jonas.nicklas@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "app/controllers/bistro_car/bundle_controller.rb", "config/routes.rb", "lib/bistro_car.rb", "lib/bistro_car/bundle.rb", "lib/bistro_car/helpers.rb", "script/console", "script/destroy", "script/generate"]
  s.homepage = %q{http://github.com/jnicklas/bistro_car}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bistro_car}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{BistroCar serves up {CoffeeScript}[http://jashkenas.github.com/coffee-script/] from within your Rails application.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jsmin>, [">= 1.0.1"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_development_dependency(%q<gemcutter>, [">= 0.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.5.0"])
    else
      s.add_dependency(%q<jsmin>, [">= 1.0.1"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_dependency(%q<gemcutter>, [">= 0.3.0"])
      s.add_dependency(%q<hoe>, [">= 2.5.0"])
    end
  else
    s.add_dependency(%q<jsmin>, [">= 1.0.1"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
    s.add_dependency(%q<gemcutter>, [">= 0.3.0"])
    s.add_dependency(%q<hoe>, [">= 2.5.0"])
  end
end
