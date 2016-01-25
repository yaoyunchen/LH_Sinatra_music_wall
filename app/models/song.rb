class Song << ActiveRecord::Base

  validates :author,
    presence: true

  validates :title,
    presence: true

  valideates :url,
    format: {with: URI.regexp}, if: Proc.new {|a| a.url.present?}

  before_validation :format_url

  private
    def format_url
      unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
        self.url = "http://#{self.url}"
      end
    end
end