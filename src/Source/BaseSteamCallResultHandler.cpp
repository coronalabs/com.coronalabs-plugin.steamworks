// ----------------------------------------------------------------------------
// 
// BaseSteamCallResultHandler.cpp
// Copyright (c) 2016 Corona Labs Inc. All rights reserved.
// This software may be modified and distributed under the terms
// of the MIT license.  See the LICENSE file for details.
//
// ----------------------------------------------------------------------------

#include "BaseSteamCallResultHandler.h"


BaseSteamCallResultHandler::BaseSteamCallResultHandler()
{
}

BaseSteamCallResultHandler::~BaseSteamCallResultHandler()
{
}

bool BaseSteamCallResultHandler::IsNotWaitingForResult() const
{
	return !IsWaitingForResult();
}
