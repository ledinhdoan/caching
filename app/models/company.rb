class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :employees, dependent: :destroy

  after_create :expire_cache
  after_update :expire_cache
  before_destroy :expire_cache
  
  def to_s
    name
  end

  def expire_cache
    ActionController::Base.expire_page(Rails.application.routes.url_helpers.company_path(self))
    ActionController::Base.expire_page(Rails.application.routes.url_helpers.companies_path)
  end
end
