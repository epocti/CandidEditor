package ;
class ColorUtils {
	public function new(){
	}

	public static function asARGB(alpha:Int, red:Int, green:Int, blue:Int):Int {
		return (alpha & 0xFF) << 24 | (red & 0xFF) << 16 | (green & 0xFF) << 8 | (blue & 0xFF);
	}
	public static function getAlphaFromARGB(color:Int):Int {
		return (color >> 24) & 0x000000FF;
	}
	public static function getRedFromARGB(color:Int):Int {
		return (color >> 16) & 0x000000FF;
	}
	public static function getGreenFromARGB(color:Int):Int {
		return (color >> 8) & 0x000000FF;
	}
	public static function getBlueFromARGB(color:Int):Int {
		return color & 0x000000FF;
	}
}
