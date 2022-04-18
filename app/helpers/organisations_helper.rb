

module OrganisationsHelper

  def format_url(url)
    if url.nil?
      return url
    else
      shorter_url = url.split('//')[1]
      unless shorter_url.nil?
      pretty_url = shorter_url.slice(0...shorter_url.index('/'))
      return pretty_url
      else
      url.slice(0...url.index('/'))
      end
    end
  end
end
