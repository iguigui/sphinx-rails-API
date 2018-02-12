class ApplianceInfo
  include Mongoid::Document
  field :name, type: String
  field :productVersion, type: String
  field :serialNumber, type: String
end
