module UploaderHelper
	def upyun_form_input_tag(opts = {})
	  form_api_key = "ts+tVh4rFogC5lAvTnt0DEW1M3E="
	  opts[:prefix] ||= ""
	  opts[:allow_exts] ||= "jpg,jpeg,gif,png"
	  opts[:min_length] ||= 0
	  opts[:max_length] ||= 200.kilobyte
	  opts[:return_url] ||= root_url
	  opts[:notify_url] ||= root_url
	  opts[:unsharp] ||= false
	  opts[:quality] ||= 95
	  hash = {
	    "bucket" => "wanmen",
	    "expiration" => 20.minutes.since.to_i,    
    	"save-key" => [opts[:prefix],"{year}/{mon}/{filemd5}{.suffix}"].join("/"),
	    "allow-file-type" => opts[:allow_exts],
	    "content-length-range" => "#{opts[:min_length].to_i},#{opts[:max_length].to_i}",
	    "return-url" => opts[:return_url],
	    "notify-url" => opts[:notify_url],
	    "x-gmkerl-unsharp" => opts[:unsharp],
	    "x-gmkerl-quality" => opts[:quality].to_i
	  }
	  puts "JSON: #{hash.to_json}"
	  policy = Base64.encode64(hash.to_json).gsub("\n","")
	  sign = Digest::MD5.hexdigest([policy,form_api_key].join("&"))
	  raw [tag(:input, :type => "hidden", :name => "policy", :value => policy),tag(:input, :type => :hidden, :name => "signature",:value => sign)].join("\n")
	end
	def domain_url()
		raw "http://localhost:3000"
	end

	def upyun_url()
		raw "http://wanmen.b0.upaiyun.com"
	end

	def upyun_api_url()
		raw "http://v0.api.upyun.com/wanmen"
	end
end
