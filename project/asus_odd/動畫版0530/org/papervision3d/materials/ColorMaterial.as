
import org.papervision3d.core.proto.MaterialObject3D;

class org.papervision3d.materials.ColorMaterial extends MaterialObject3D
{
	// ______________________________________________________________________ NEW

	/**
	* The ColorMaterial class creates a texture from a BitmapData object.
	*
	* @param	asset				A BitmapData object.
	* @param	initObject			[optional] - An object that contains additional properties with which to populate the newly created material.
	*/
	public function ColorMaterial( color:Number, alpha:Number, initObject:Object )
	{
		super( initObject );

		this.fillColor = color || MaterialObject3D.DEFAULT_COLOR;
		this.fillAlpha = alpha || 100;
	}


	// ______________________________________________________________________ TO STRING

	/**
	* Returns a string value representing the material properties in the specified ColorMaterial object.
	*
	* @return	A string.
	*/
	public function toString(): String
	{
		return 'ColorMaterial - color:' + this.fillColor + ' alpha:' + this.fillAlpha;
	}
}