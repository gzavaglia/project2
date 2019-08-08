require_relative './config/env'


use Rack::MethodOverride
use UserController
run ApplicationController