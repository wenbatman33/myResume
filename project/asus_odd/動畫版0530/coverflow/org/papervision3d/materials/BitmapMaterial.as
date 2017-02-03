
// __________________________________________________________________________ BITMAP MATERIAL

import org.papervision3d.core.proto.MaterialObject3D;

import flash.display.BitmapData;

/**
* The BitmapMaterial class creates a texture from a BitmapData object.
*
* A material is extra that you assign to objects or faces, so that they appear a certain way when rendered. Materials affect the line and fill colors.
*
* Materials create greater realism in a scene. A material describes how an object reflects or transmits light. You assign materials to individual objects or a selection of faces; a single object can contain different materials.
*
*/
class org.papervision3d.materials.BitmapMaterial extends MaterialObject3D
{

	// ______________________________________________________________________ TEXTURE

	/**
	* A texture object.
	*/
	public function get texture():BitmapData
	{
		return this._texture;
	}

	public function set texture( asset )
	{
		this.bitmap = createBitmap( asset );
		this._texture = asset;
	}


	// ______________________________________________________________________ NEW

	/**
	* The BitmapMaterial class creates a texture from a BitmapData object.
	*
	* @param	asset				A BitmapData object.
	* @param	initObject			[optional] - An object that contains additional properties with which to populate the newly created material.
	*/
	public function BitmapMaterial( asset, initObject:Object )
	{
		super( initObject );

		texture = asset;
	}


	// ______________________________________________________________________ TO STRING

	/**
	* Returns a string value representing the material properties in the specified BitmapMaterial object.
	*
	* @return	A string.
	*/
	public function toString(): String
	{
		return 'Texture:' + this.texture + ' lineColor:' + this.lineColor + ' lineAlpha:' + this.lineAlpha;
	}


	// ______________________________________________________________________ CREATE BITMAP

	private function createBitmap( asset:BitmapData ):BitmapData
	{
		return asset;
	}


	// ______________________________________________________________________ PRIVATE VAR

	private var _texture;
}