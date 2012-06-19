# -*- coding: utf-8 -*-
require "optparse"

require "motion-util/version"
require "motion-util/util"


Version = Motion::Util.VERSION

opt = OptionParser.new

opt.banner = <<EOF
Usage:
motion-util: command [options]

Usage:

EOF
