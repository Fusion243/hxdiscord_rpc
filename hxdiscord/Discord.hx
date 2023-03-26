package hxdiscord;

#if (!cpp && macro)
#error 'Discord RPC supports only C++ target.'
#end
import hxdiscord.Types;

@:buildXml("<include name='${haxelib:hxdiscord-rpc}/project/Build.xml' />")
@:include("discord_register.h")
@:include("discord_rpc.h")
@:keep
@:unreflective
extern class Discord
{
	@:native('Discord_Register')
	static function Register(applicationId:String, command:String):Void;

	@:native('Discord_RegisterSteamGame')
	static function RegisterSteamGame(applicationId:String, steamId:String):Void;

	@:native('DISCORD_REPLY_NO')
	static var REPLY_NO:Int;

	@:native('DISCORD_REPLY_YES')
	static var REPLY_YES:Int;

	@:native('DISCORD_REPLY_IGNORE')
	static var REPLY_IGNORE:Int;

	@:native('DISCORD_PARTY_PRIVATE')
	static var PARTY_PRIVATE:Int;

	@:native('DISCORD_PARTY_PUBLIC')
	static var PARTY_PUBLIC:Int;

	@:native('Discord_Initialize')
	static function Initialize(applicationId:String, handlers:cpp.RawPointer<DiscordEventHandlers>, autoRegister:Int, optionalSteamId:String):Void;

	@:native('Discord_Shutdown')
	static function Shutdown():Void;

	/* checks for incoming messages, dispatches callbacks */
	@:native('Discord_RunCallbacks')
	static function RunCallbacks():Void;

	/* If you disable the lib starting its own io thread, you'll need to call this from your own */
	@:native('Discord_UpdateConnection')
	static function UpdateConnection():Void;

	@:native('Discord_UpdatePresence')
	static function UpdatePresence(presence:cpp.RawConstPointer<DiscordRichPresence>):Void;

	@:native('Discord_ClearPresence')
	static function ClearPresence():Void;

	@:native('Discord_Respond')
	static function Respond(userid:String, reply:Int):Void;

	@:native('Discord_UpdateHandlers')
	static function UpdateHandlers(handlers:cpp.RawPointer<DiscordEventHandlers>):Void;
}
