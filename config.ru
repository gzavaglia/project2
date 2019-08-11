require_relative './config/env'


use Rack::MethodOverride
use UserController
use ShowsController
run ApplicationController