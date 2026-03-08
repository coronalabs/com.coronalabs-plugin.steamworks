# steamworks.triggerItemDrop()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, inventory, drops, triggerItemDrop
> __See also__          [inventoryResultReady][plugin.steamworks.event.inventoryResultReady]
>                       [steamworks.getInventoryResultItems()][plugin.steamworks.getInventoryResultItems]
>                       [steamworks.destroyInventoryResult()][plugin.steamworks.destroyInventoryResult]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Requests an inventory drop from Steam using the given drop list definition.

Returns `true` if the request was successfully sent to Steam. Note that this does not necessarily mean that the requested operation will succeed. Always check the [event.isError][plugin.steamworks.event.inventoryResultReady.isError] field in the received [inventoryResultReady][plugin.steamworks.event.inventoryResultReady] event.


## Syntax

	steamworks.triggerItemDrop( dropListDefinition [, listener] )

##### dropListDefinition ~^(required)^~
_[Number][api.type.Number]._ The Steam item definition ID of the drop list to trigger.

##### listener ~^(optional)^~
_[Function][api.type.Function]._ Listener that receives the [inventoryResultReady][plugin.steamworks.event.inventoryResultReady] event for this request. If omitted, you can receive the event via [steamworks.addEventListener()][plugin.steamworks.addEventListener].


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onInventoryResultReady( event )
	if ( event.isError ) then
		print( "Inventory drop failed. Result code: " .. tostring(event.resultCode) )
		return
	end

	local items = steamworks.getInventoryResultItems( event.resultHandle ) or {}
	for i = 1, #items do
		local item = items[i]
		print( "Drop item def:", item.itemDefId, "qty:", item.quantity )
	end

	steamworks.destroyInventoryResult( event.resultHandle )
end

steamworks.triggerItemDrop( 1000, onInventoryResultReady )
``````
