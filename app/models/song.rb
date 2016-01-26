class Song < ActiveRecord::Base
  belongs_to :user

  validates :user_id, 
    presence: true

  validates :title,
    presence: true

  # validates :url,
  #   format: {with: URI::regexp}, if: Proc.new { |a| a.url.present? }

  before_validation :format_url

  private
    def format_url
      if self.url.present?
        unless  self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
          self.url = "http://#{self.url}"
        end
      end
    end
end