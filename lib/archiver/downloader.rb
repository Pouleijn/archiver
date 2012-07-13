require 'net/http'

module Archiver
  class Downloader
    def download(url, path)
      url = URI.parse(url)
      
      Net::HTTP.start(url.host) do |http|
        response = http.get("#{url.path}?#{url.query}")
        open(path, "wb") do |file|
          file.write(response.body)
        end
      end
      
      true
    end
  end
end