

// ______________________________________________________________________
//                                                             Viewport3D

/**
* The Vertex3D constructor lets you create 3D vertices.
*/
class org.papervision3d.core.geom.Viewport
{
	/**
	* An Number that sets the max Y screen coordinate of the render.
	*/
	public var top :Number;

	/**
	* An Number that sets the min Y screen coordinate of the render.
	*/
	public var bottom :Number;

	/**
	* An Number that sets the max X screen coordinate of the render.
	*/
	public var right :Number;

	/**
	* An Number that sets the min X screen coordinate of the render.
	*/
	public var left :Number;

	/**
	* Creates a new Viewport object.
	*
	* @param	top		The max Y screen coordinate of the render.
	* @param	bottom	The min Y screen coordinate of the render.
	* @param	right	The max X screen coordinate of the render.
	* @param	left	The min X screen coordinate of the render.
	*
	*/
	public function Viewport( top:Number, bottom:Number, right:Number, left:Number )
	{
		this.top    = top    || 0;
		this.bottom = bottom || 0;
		this.right  = right  || 0;
		this.left   = left   || 0;
	}
}