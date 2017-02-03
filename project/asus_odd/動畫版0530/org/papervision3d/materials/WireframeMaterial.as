
import org.papervision3d.core.proto.MaterialObject3D;

class org.papervision3d.materials.WireframeMaterial extends MaterialObject3D
{
	// ______________________________________________________________________ NEW

	/**
	* The WireframeMaterial class creates a texture from a BitmapData object.
	*
	* @param	asset				A BitmapData object.
	* @param	initObject			[optional] - An object that contains additional properties with which to populate the newly created material.
	*/
	public function WireframeMaterial( color:Number, alpha:Number, initObject:Object )
	{
		super( initObject );

		this.lineColor = color || MaterialObject3D.DEFAULT_COLOR;
		this.lineAlpha = alpha || 100;
	}


	// ______________________________________________________________________ TO STRING

	/**
	* Returns a string value representing the material properties in the specified WireframeMaterial object.
	*
	* @return	A string.
	*/
	public function toString(): String
	{
		return 'WireframeMaterial - color:' + this.lineColor + ' alpha:' + this.lineAlpha;
	}
}