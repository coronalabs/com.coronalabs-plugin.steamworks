# steamworks.getInventoryResultItems()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, inventory, getInventoryResultItems
> __See also__          [inventoryResultReady][plugin.steamworks.event.inventoryResultReady]
>                       [steamworks.destroyInventoryResult()][plugin.steamworks.destroyInventoryResult]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an array of items for the given inventory result handle. Returns `nil` if the handle is invalid or the result is unavailable.

Each array entry is a table with the following fields:
- `itemDefId` ([Number][api.type.Number])
- `quantity` ([Number][api.type.Number])
- `flags` ([Number][api.type.Number])
- `instanceId` ([String][api.type.String])


## Syntax

	steamworks.getInventoryResultItems( resultHandle )

##### resultHandle ~^(required)^~
_[Number][api.type.Number]._ Inventory result handle provided by an [inventoryResultReady][plugin.steamworks.event.inventoryResultReady] event.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onInventoryResultReady( event )
	if ( event.isError ) then
		return
	end

	local items = steamworks.getInventoryResultItems( event.resultHandle ) or {}
	print( "Items in result:", #items )
	steamworks.destroyInventoryResult( event.resultHandle )
end

steamworks.addEventListener( "inventoryResultReady", onInventoryResultReady )
``````
