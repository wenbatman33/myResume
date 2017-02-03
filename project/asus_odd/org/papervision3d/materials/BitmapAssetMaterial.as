

// __________________________________________________________________________ BITMAP ASSET MATERIAL

import org.papervision3d.core.utils.AssetLibrary;
import org.papervision3d.materials.BitmapMaterial;

import flash.display.BitmapData;


/**
* The BitmapAssetMaterial class creates a texture from a Bitmap library symbol.
*
* A material is extra that you assign to objects or faces, so that they appear a certain way when rendered. Materials affect the line and fill colors.
*
* Materials create greater realism in a scene. A material describes how an object reflects or transmits light. You assign materials to individual objects or a selection of faces; a single object can contain different materials.
*
*/
class org.papervision3d.materials.BitmapAssetMaterial extends BitmapMaterial
{

	// ______________________________________________________________________ NEW

	/**
	* The BitmapAssetMaterial class creates a texture from a Bitmap library asset.
	*
	* @param	id					The linkage name of the Bitmap symbol in the library.
	* @param	initObject			[optional] - An object that contains additional properties with which to populate the newly created material.
	*/

	public function BitmapAssetMaterial( id:String, initObject:Object )
	{
		super( id, initObject );
	}


	// ______________________________________________________________________ CREATE BITMAP

	private function createBitmap( asset:String ):BitmapData
	{
		// Remove previous bitmap
		if( this._texture != asset )
		{
			var prevBitmap:BitmapData = AssetLibrary.getAsset( this._texture );

			if( AssetLibrary.subAsset( this._texture ) == 0 )
				prevBitmap.dispose();
		}

		// Retrieve from library or...
		var bitmap:BitmapData = AssetLibrary.getAsset( asset );

		// ...loadBitmap
		if( ! bitmap )
			bitmap = BitmapData.loadBitmap( asset );

		// Add to library
		AssetLibrary.addAsset( asset, bitmap );

		return bitmap;
	}
}