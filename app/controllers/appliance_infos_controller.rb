class ApplianceInfosController < ApplicationController

	def getApplianceInfos
	  a = ApplianceInfo.first
	  # appliance_infos = {name: a.name, productVersion: a.productVersion, serialNumber: a.serialNumber}
	  # puts appliance_infos
  	render status: 200, json: [ 
  		{name: a.name, productVersion: a.productVersion, serialNumber: a.serialNumber} 
  	]
	end

end