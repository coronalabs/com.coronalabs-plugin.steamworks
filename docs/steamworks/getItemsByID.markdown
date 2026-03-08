# steamworks.getItemsByID()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, inventory, getItemsByID
> __See also__          [inventoryResultReady][plugin.steamworks.event.inventoryResultReady]
>                       [steamworks.getInventoryResultItems()][plugin.steamworks.getInventoryResultItems]
>                       [steamworks.destroyInventoryResult()][plugin.steamworks.destroyInventoryResult]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Requests a subset of inventory items by item instance ID. The result is delivered via the [inventoryResultReady][plugin.steamworks.event.inventoryResultReady] event.

Returns `true` if the request was successfully sent to Steam. Note that this does not necessarily mean that the requested operation will succeed. Always check the [event.isError][plugin.steamworks.event.inventoryResultReady.isError] field in the received event.


## Syntax

	steamworks.getItemsByID( itemInstanceIds [, listener] )

##### itemInstanceIds ~^(required)^~
_[Table][api.type.Table]._ Array of item instance IDs (strings or numbers).

##### listener ~^(optional)^~
_[Function][api.type.Function]._ Listener that receives the [inventoryResultReady][plugin.steamworks.event.inventoryResultReady] event for this request. If omitted, you can receive the event via [steamworks.addEventListener()][plugin.steamworks.addEventListener].


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onInventoryResultReady( event )
	if ( event.isError ) then
		return
	end
	local items = steamworks.getInventoryResultItems( event.resultHandle ) or {}
	print( "Items returned:", #items )
	steamworks.destroyInventoryResult( event.resultHandle )
end

steamworks.getItemsByID( { "12345678901234567" }, onInventoryResultReady )
``````
