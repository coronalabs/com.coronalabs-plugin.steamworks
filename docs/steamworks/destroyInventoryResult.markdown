# steamworks.destroyInventoryResult()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, inventory, destroyInventoryResult
> __See also__          [inventoryResultReady][plugin.steamworks.event.inventoryResultReady]
>                       [steamworks.getInventoryResultItems()][plugin.steamworks.getInventoryResultItems]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Destroys an inventory result handle and frees the associated memory. Call this after you finish inspecting a result.


## Syntax

	steamworks.destroyInventoryResult( resultHandle )

##### resultHandle ~^(required)^~
_[Number][api.type.Number]._ Inventory result handle provided by an [inventoryResultReady][plugin.steamworks.event.inventoryResultReady] event.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onInventoryResultReady( event )
	if ( not event.isError ) then
		steamworks.getInventoryResultItems( event.resultHandle )
	end
	steamworks.destroyInventoryResult( event.resultHandle )
end

steamworks.addEventListener( "inventoryResultReady", onInventoryResultReady )
``````
