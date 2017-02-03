import flash.filters.ColorMatrixFilter;
import flash.display.BitmapData;
import flash.geom.Matrix;
class com.milkmidi.method.BitmapUtil {
	
	public static function gray():ColorMatrixFilter{
		var colorFilter:ColorMatrixFilter = new flash.filters.ColorMatrixFilter();
		var redIdentity:Array = [1, 0, 0, 0, 0];
		var greenIdentity:Array = [0, 1, 0, 0, 0];
		var blueIdentity:Array = [0, 0, 1, 0, 0];
		var alphaIdentity:Array = [0, 0, 0, 1, 0];
		var grayluma:Array = [.3, .59, .11, 0, 0];
		var colmatrix:Array = new Array();
		function interpolateArrays(ary1, ary2, t) {
			var result:Array = (ary1.length >= ary2.length) ? ary1.slice() : ary2.slice();
			var i = result.length;
			while (i--) {
				result[i] = ary1[i] + (ary2[i] - ary1[i]) * t;
			}
			return result;
		}
		colmatrix = colmatrix.concat(interpolateArrays(grayluma, redIdentity, 0));
		colmatrix = colmatrix.concat(interpolateArrays(grayluma, greenIdentity, 0));
		colmatrix = colmatrix.concat(interpolateArrays(grayluma, blueIdentity, 0));
		colmatrix = colmatrix.concat(alphaIdentity);
		colorFilter.matrix = colmatrix;
		return colorFilter;
	}
	
	public static function smooth(target:MovieClip):Void
	{
		if (target == null || target == undefined) throw new Error("null target");
		if ( target._smoothBMP != null ) BitmapUtil.removeSmooth(target);
		
		target._smoothBMP =  new BitmapData(target._width, target._height, true, 0);		
		target._smoothBMP.draw(target);
		target.attachBitmap(target._smoothBMP, target.getNextHighestDepth(), "auto", true);
	}
	public static function removeSmooth(target:MovieClip):Void
	{
		if (target == null || target == undefined) throw new Error("null target");
		if (target._smoothBMP != null && target._smoothBMP != undefined) {
			target._smoothBMP.dispose();
			target._smoothBMP = null;		
		}		
	}
	public static function reflect(mc:MovieClip,isAttach:Boolean):BitmapData
	{	
		var alpha:Number = 60;
		var ratio:Number = 255;
		var _newWidth:Number = mc._width;
		var _newHeight:Number = mc._height;
		
		var _originBMP:BitmapData = new BitmapData(_newWidth, _newHeight, true, 0);
		_originBMP.draw(mc);
		
		
		var containerMC:MovieClip = mc.createEmptyMovieClip("_containerMC__", mc.getNextHighestDepth());		
		var reflectionMC:MovieClip = containerMC.createEmptyMovieClip("_reflectionMC__", 1);
		reflectionMC.attachBitmap(_originBMP, 1);
		reflectionMC._yscale = -100;
		//reflectionMC._y = -mc._height;
		
		//create the gradient mask
		var maskMC:MovieClip = containerMC.createEmptyMovieClip("_maskMC__", 2);
		var fillType:String = "linear";
		var colors:Array = [0xFFFFFF, 0xFFFFFF];
		var alphas:Array = [alpha, 0];
		var ratios:Array = [0, ratio];
		var matrix:Object = { matrixType:"box", x:0, y:0, w:_newWidth, h:_newHeight / 3, r:(90 / 180) * Math.PI };
		var spreadMethod:String = "pad";
		maskMC.beginGradientFill(fillType, colors, alphas, ratios, matrix, spreadMethod);
		maskMC.moveTo(0, 0);
		maskMC.lineTo(0, _newHeight / 2);
		maskMC.lineTo(_newWidth, _newHeight / 2);
		maskMC.lineTo(_newWidth, 0);
		maskMC.lineTo(0, 0);
		maskMC.endFill();
		maskMC._y = _newHeight / 2;
		reflectionMC.cacheAsBitmap = true;
		maskMC.cacheAsBitmap = true;
		reflectionMC.setMask(maskMC);
		
		if (isAttach) {			
			reflectionMC._y = _newHeight * 2;
			maskMC._y = mc._height / 2;
			return null;
		}
		var _returnBMP:BitmapData = new BitmapData(_newWidth, _newHeight, true, 0);
		var mat:Matrix = new Matrix();
		mat.translate(0, _newHeight);
		_returnBMP.draw(containerMC);
		containerMC.removeMovieClip();
		return _returnBMP;
		
	}

}