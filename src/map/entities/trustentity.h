﻿/*
===========================================================================

  Copyright (c) 2018 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#ifndef _CTRUSTENTITY_H
#define _CTRUSTENTITY_H

#include "mobentity.h"
#include "../spell.h"
#include "../items/item_equipment.h"
#include "../items/item_usable.h"

// PTrust->m_MovementType is read from 'behaviour' in a trust's mob_pool entry
enum class TRUST_MOVEMENT_TYPE
{
    MELEE_RANGE        = 0, // Default
    NO_MOVE            = 1,
    MID_RANGE          = 2,
    LONG_RANGE         = 3,
    LAST_MOVEMENT_TYPE = 4,
};

enum class BRD_SONG_BUCKET : uint8
{
    NORMAL   = 0,
    ACC      = 1,
    HIGH_ACC = 2,
    MP       = 3,
    LOW_MP   = 4,
};

class CCharEntity;
class CAbilityState;
class CRangeState;
class CDespawnState;
class CItemState;
class CMagicState;
class CMobSkillState;
class CWeaponSkillState;
class CUContainer;
class CItemEquipment;
class CItemUsable;

class CTrustEntity : public CMobEntity
{
public:
    explicit CTrustEntity(CCharEntity*);
    ~CTrustEntity() override = default;

    void PostTick() override;
    void FadeOut() override;
    void Die() override;
    void Spawn() override;
    void OnAbility(CAbilityState&, action_t&) override;
    void OnRangedAttack(CRangeState&, action_t&) override;
    bool ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags) override;
    void OnDespawn(CDespawnState&) override;

    void OnCastFinished(CMagicState& state, action_t& action) override;
    void OnMobSkillFinished(CMobSkillState& state, action_t& action) override;
    void OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action) override;
    void EquipItem(CItemEquipment* PItem, int8 slotId);
    void HandleTrade(CCharEntity* PChar);
    virtual void OnItemFinish(CItemState&, action_t&);
    int8 getShieldSize();

    uint32              m_TrustID{};
    TRUST_MOVEMENT_TYPE m_MovementType;
    CItemEquipment*     equip[16];
    CItemUsable*        food;
    CUContainer*        UContainer; // container used for universal actions -- used for trading at least despite the dedicated trading container above

    std::map<BRD_SONG_BUCKET, std::vector<SpellID>> melee_songs{
        { BRD_SONG_BUCKET::NORMAL, std::vector<SpellID>() },
        { BRD_SONG_BUCKET::ACC, std::vector<SpellID>() },
        { BRD_SONG_BUCKET::HIGH_ACC, std::vector<SpellID>() },
    };
    std::map<BRD_SONG_BUCKET, std::vector<SpellID>> mage_songs = {
        { BRD_SONG_BUCKET::MP, std::vector<SpellID>() },
        { BRD_SONG_BUCKET::LOW_MP, std::vector<SpellID>() },
    };
    std::map<BRD_SONG_BUCKET, std::vector<SpellID>> ranged_songs = {
        { BRD_SONG_BUCKET::NORMAL, std::vector<SpellID>() },
        { BRD_SONG_BUCKET::ACC, std::vector<SpellID>() },
        { BRD_SONG_BUCKET::HIGH_ACC, std::vector<SpellID>() },
    };
    std::map<BRD_SONG_BUCKET, std::vector<SpellID>> tank_songs = {
        { BRD_SONG_BUCKET::MP, std::vector<SpellID>() },
        { BRD_SONG_BUCKET::LOW_MP, std::vector<SpellID>() },
    };
};

#endif
