module ShippingConsumer
  module ShippingHelper
    # takes a weight in lbz, String or Float (eg "5.6") and returns
    # an array of [lbz, oz] where oz is rounded up to the next oz
    # (eg [5, 10] instead of [5, 9.6])
    def self.weight_in_lbz_oz(weight)
      weight = weight.to_f
      pounds = weight.floor
      decimal = weight - pounds
      ounces = (decimal * 16).ceil
      return [pounds, ounces]
    end
    
    def self.upcase!(*args)
      args.each {|arg| next if !arg; arg.gsub!(/_/, " ") if arg.upcase!}
    end
    
    def self.five_digit_zip!(*args)
      args.each {|arg| arg.to_s.gsub!(/^(.{5}).*/ , "\\1") if arg}
    end
    
    # sorts rates by price, and puts them into a hash of the form 
    # 'carrier' => [rates for carrier]
    def self.carrier_rates_hash(rates)
      rates = rates.sort {|a,b| a.price <=> b.price}
      carriers = rates.collect {|r| r.carrier}.uniq
      result = {}
      carriers.each do |carrier|
        result[carrier] = rates.find_all {|r| r.carrier == carrier}
      end

      return result
    end
  end
end