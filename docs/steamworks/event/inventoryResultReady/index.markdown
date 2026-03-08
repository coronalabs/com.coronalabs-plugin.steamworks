# inventoryResultReady

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, inventory, inventoryResultReady
> __See also__          [steamworks.triggerItemDrop()][plugin.steamworks.triggerItemDrop]
>                       [steamworks.getInventoryResultItems()][plugin.steamworks.getInventoryResultItems]
>                       [steamworks.destroyInventoryResult()][plugin.steamworks.destroyInventoryResult]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Event providing the result of an inventory request such as [steamworks.triggerItemDrop()][plugin.steamworks.triggerItemDrop].

This event can be received by:
- A listener function passed to [steamworks.triggerItemDrop()][plugin.steamworks.triggerItemDrop].
- A listener added via [steamworks.addEventListener()][plugin.steamworks.addEventListener].


## Properties

#### [event.resultHandle][plugin.steamworks.event.inventoryResultReady.resultHandle]

#### [event.resultCode][plugin.steamworks.event.inventoryResultReady.resultCode]

#### [event.isError][plugin.steamworks.event.inventoryResultReady.isError]

#### [event.name][plugin.steamworks.event.inventoryResultReady.name]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onInventoryResultReady( event )
	if ( event.isError ) then
		print( "Inventory request failed." )
		return
	end

	local items = steamworks.getInventoryResultItems( event.resultHandle ) or {}
	print( "Items returned:", #items )
	steamworks.destroyInventoryResult( event.resultHandle )
end

steamworks.addEventListener( "inventoryResultReady", onInventoryResultReady )
``````
