# -*- coding: utf-8 -*-
require "optparse"

require "motion-util/version"
require "motion-util/util"
require "motion-util/command/generator"


Version = Motion::Util::VERSION

opt = OptionParser.new

opt.banner = Motion::Util::Dispatcher::usage


argv = opt.parse(ARGV)

if argv.size == 0
  argv.unshift "--help"
  argv = opt.parse(argv)
end
