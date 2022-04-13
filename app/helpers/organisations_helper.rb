

module OrganisationsHelper

  def format_url(url)
    shorter_url = url.split('//')[1]
    pretty_url = shorter_url.slice(0...shorter_url.index('/'))
    pretty_url
  end
end
