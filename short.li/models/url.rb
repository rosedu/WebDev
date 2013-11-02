class Url < ActiveRecord::Base
  validates :original,
            :length => { :minimum => 2, :maximum => 255 },
            :presence => { :on => :create, :message => "can't be blank" }
  
  validates :slug,
            :length => { :minimum => 1, :maximum => 20 },
            :presence => { :on => :create, :message => "could not be generated" },
            :uniqueness => true

  before_validation :shorten_url
  
  private
  def shorten_url
    self.slug = Url.count.alphadecimal
  end
end