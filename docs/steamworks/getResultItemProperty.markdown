# steamworks.getResultItemProperty()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, inventory, getResultItemProperty
> __See also__          [inventoryResultReady][plugin.steamworks.event.inventoryResultReady]
>                       [steamworks.getInventoryResultItems()][plugin.steamworks.getInventoryResultItems]
>                       [steamworks.destroyInventoryResult()][plugin.steamworks.destroyInventoryResult]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a string property value for an item within a result set. Pass `nil` for the property name to get a comma-separated list of available properties. Returns `nil` if the property lookup fails.


## Syntax

	steamworks.getResultItemProperty( resultHandle, itemIndex [, propertyName] )

##### resultHandle ~^(required)^~
_[Number][api.type.Number]._ Inventory result handle provided by an [inventoryResultReady][plugin.steamworks.event.inventoryResultReady] event.

##### itemIndex ~^(required)^~
_[Number][api.type.Number]._ Zero-based index into the result item list.

##### propertyName ~^(optional)^~
_[String][api.type.String]._ Property name to fetch, or `nil` to return a comma-separated list of available property names.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onInventoryResultReady( event )
	if ( event.isError ) then
		return
	end
	local names = steamworks.getResultItemProperty( event.resultHandle, 0, nil )
	print( "Item properties:", names or "none" )
	steamworks.destroyInventoryResult( event.resultHandle )
end

steamworks.getAllItems( onInventoryResultReady )
``````
