# ShadowedUnitFrames - Mists of Pandaria Classic Port

This is a community port of [ShadowedUnitFrames](https://github.com/Nevcairiel/ShadowedUnitFrames) adapted for **Mists of Pandaria Classic** (game version 62044). The original addon by Nevcairiel has been modified to work with the MoP Classic API and feature set.

## Installation

1. Download or clone this repository
2. Copy the `ShadowedUnitFrames` folder to your `World of Warcraft\_classic_\Interface\AddOns\` directory
3. Restart World of Warcraft or reload your UI (`/reload`)
4. Configure the addon through the in-game interface options or by typing `/suf`

## Major Changes for MoP Classic Compatibility

### API Updates
- **Interface Version**: Updated from 110107 to 62044 to match MoP Classic
- **Aura APIs**: Replaced modern `C_UnitAuras` functions with classic `UnitBuff`/`UnitDebuff`
- **AddOn Loading**: Replaced `C_AddOns.LoadAddOn` with classic `LoadAddOn`
- **Timer APIs**: Replaced modern `C_Timer` usage with classic OnUpdate frame timers
- **UnitBuff/UnitDebuff Parameter Order**: Fixed parameter unpacking to match MoP Classic's API signature

### Removed Features (Not Available in MoP Classic)
- **Essence Module**: Completely disabled as essences don't exist in MoP
- **Modern Classes**: Removed Evoker and other post-MoP classes
- **Modern Power Types**: Removed Insanity, Maelstrom, Fury, Pain, and Lunar Power
- **Specialization Detection**: Replaced `GetSpecialization()` with MoP-compatible talent detection
- **Modern Events**: Removed `INCOMING_SUMMON_CHANGED` and other unsupported events
- **Quest Boss Indicator**: Disabled due to missing `UnitIsQuestBoss` API
- **Summon Pending Indicator**: Removed due to missing supporting APIs

### Frame Template Fixes
- **Removed Modern Templates**: Stripped `PingableUnitFrameTemplate` from frame inheritance
- **Blizzard Frame Compatibility**: Added nil checks for frames that may not exist in MoP Classic

### Bug Fixes
- **Syntax Errors**: Fixed invalid `continue` statements and misplaced `return` statements
- **Nil Value Protection**: Added defensive programming throughout to prevent nil indexing
- **Type Conversion**: Fixed string/number comparison errors in aura handling
- **Max Level**: Hardcoded max level to 90 for MoP Classic

## Known Limitations

- **No Essence System**: The essence module is completely disabled
- **Limited Specialization Data**: Uses MoP Classic talent system instead of modern specializations  
- **Hardcoded Max Level**: Uses 90 instead of dynamic level detection
- **No Modern Power Types**: Only supports power types available in MoP (Mana, Rage, Energy, etc.)
- **No Quest Boss Detection**: Quest boss indicators are disabled

## Configuration

The addon can be configured through:
- **In-game Interface Options**: Esc → Interface → AddOns → ShadowedUnitFrames
- **Slash Command**: `/suf` - Opens the configuration panel
- **Profiles**: Supports multiple profiles for different characters/specs

## Troubleshooting

### Common Issues
1. **"AddOn is out of date"**: Ensure the interface version in `.toc` matches your game version
2. **Lua Errors**: Enable Lua error reporting to see detailed error messages
3. **Missing Features**: Some modern WoW features are intentionally disabled for MoP compatibility

### Debug Commands
- `/suf reset` - Reset all settings to defaults
- `/reload` - Reload the UI after making changes
- `/run SetCVar("scriptErrors", 1)` - Enable Lua error reporting

## Development & Maintenance

### File Structure
- `ShadowedUnitFrames.lua` - Main addon file and initialization
- `modules/` - Individual feature modules (auras, xp, units, etc.)
- `libs/` - External library dependencies  
- `localization/` - Translated strings
- `media/` - Textures, fonts, and other assets

### Key Files Modified for MoP Classic
- `ShadowedUnitFrames.toc` - Interface version and metadata
- `ShadowedUnitFrames.lua` - API compatibility and initialization
- `modules/auras.lua` - Aura handling and API parameter fixes
- `modules/units.lua` - Unit frame creation and specialization handling
- `modules/essence.lua` - Disabled for MoP Classic
- `modules/xp.lua` - Experience and max level handling
- `modules/indicators.lua` - Removed unsupported indicators

### API References
- [MoP Classic API Changes](https://wowpedia.fandom.com/wiki/Patch_5.4.0)
- [UnitBuff API Documentation](https://wowpedia.fandom.com/wiki/API_UnitBuff)
- [Classic vs Retail API Differences](https://wowpedia.fandom.com/wiki/World_of_Warcraft_API#Classic_Specific_Functions)

## Contributing

This is a community port. If you find bugs or have improvements:
1. Test thoroughly in MoP Classic
2. Ensure compatibility with game version 62044
3. Document any API differences or limitations
4. Follow the existing code style and patterns

## Credits

- **Original Addon**: [Nevcairiel](https://github.com/Nevcairiel/ShadowedUnitFrames) - Creator of ShadowedUnitFrames
- **MoP Classic Port**: Community adaptation for Mists of Pandaria Classic
- **API Documentation**: Wowpedia contributors and the WoW addon development community

## License

This port maintains compatibility with the original addon's licensing. Please refer to the original ShadowedUnitFrames repository for licensing information.

## Disclaimer

This is an unofficial community port. It is not affiliated with or endorsed by the original author. Use at your own risk and always backup your WTF folder before installing new addons.

---

**Last Updated**: July 2025  
**Compatible With**: Mists of Pandaria Classic (Build 62044)  
**Original Version**: ShadowedUnitFrames for Modern WoW
