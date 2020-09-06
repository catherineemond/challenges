def valid_ip_address(ip)
  return "IPv4" if valid_ipv4(ip)
  return "IPv6" if valid_ipv6(ip)

  "Neither"
end

def valid_ipv4(ip)
   ipv4_pattern = /^\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}$/
   ip.match?(ipv4_pattern) && all_ipv4_digits_valid?(ip)
end

def all_ipv4_digits_valid?(ip)
  groups = ip.split('.')
   
  return false if groups.any? { |str| str.length > 1 && str[0] == '0' }
  return false if groups.map(&:to_i).any? { |n| n < 0 || n > 255 }

  true
end

def valid_ipv6(ip)
  ipv6_pattern = /^[0-9a-fA-F]{1,4}(:[0-9a-fA-F]{1,4}){7}$/
  ip.match?(ipv6_pattern)
end