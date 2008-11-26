require 'rubygems'
require 'consumer'

$:.unshift(File.dirname(__FILE__))

module ShippingConsumer; end

require 'shipping_consumer/shipping_helper' # needs to load first
Dir.glob(File.join(File.dirname(__FILE__), 'shipping_consumer/**/*.rb')).each do |f| 
  require f unless f =~ /rate\.rb/ && defined?(ShippingConsumer::SKIP_RATE) && ShippingConsumer::SKIP_RATE == true 
end