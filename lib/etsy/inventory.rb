module Etsy

  class Inventory

    include Etsy::Model

    # Update the inventory for a listing:
    #
    # Name                 Required Type
    # listing_id           Y        int
    # products             Y        stringJSON
    # price_on_property    N        array(int)
    # quantity_on_property N        array(int)
    # sku_on_property      N        array(int)

    def self.update(listing_id, options = {})
      options.merge!(:require_secure => true)
      put("/listings/#{listing_id}/inventory", options)
    end

    # Get the inventory for a listing
    #
    # Name                    Required Type
    # listing_id              Y        int
    # write_missing_inventory N        boolean

    def self.find(listing_id, options = {})
      options.merge!(:require_secure => true)
      get("/listings/#{listing_id}/inventory", options)
    end
  end
end
