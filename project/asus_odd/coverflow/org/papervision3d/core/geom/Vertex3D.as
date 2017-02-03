

// ______________________________________________________________________
//                                                               Vertex3D


import org.papervision3d.core.Number3D;

/**
* The Vertex3D constructor lets you create 3D vertices.
*/
class org.papervision3d.core.geom.Vertex3D
{
	/**
	* An Number that sets the X coordinate of a object relative to the scene coordinate system.
	*/
	public var x :Number;

	/**
	* An Number that sets the Y coordinate of a object relative to the scene coordinates.
	*/
	public var y :Number;

	/**
	* An Number that sets the Z coordinate of a object relative to the scene coordinates.
	*/
	public var z :Number;

	/**
	* An object that contains user defined properties.
	*/
	public var extra :Object;


	/**
	* [internal-use] A Number3D object that specifies the original position of the vertex in 3D space.
	*/
	public var toScale :Number3D;

	/**
	* [internal-use] A Number3D object that specifies the scaled position of the vertex in 3D space.
	*/
	public var toRotate :Number3D;

	/**
	* [internal-use] A Number3D object that specifies the current position of the vertex in the 2D screen.
	*/
	public var screen :Number3D;

	/**
	* [internal-use] A Boolean value that indicates whether the vertex is visible after projection.
	*
	* If false, it indicates that the vertex is behind the camera plane.
	*
	* */
	public var visible :Boolean;


	/**
	* Creates a new Vertex3D object whose three-dimensional values are specified by the x, y and z parameters.
	*
	* @param	x	The horizontal coordinate value. The default value is zero.
	* @param	y	The vertical coordinate value. The default value is zero.
	* @param	z	The depth coordinate value. The default value is zero.
	*
	* */
	public function Vertex3D( x:Number, y:Number, z:Number )
	{
		this.x = x || 0;
		this.y = y || 0;
		this.z = z || 0;

		this.toScale  = new Number3D( x, y, z );
		this.toRotate = new Number3D( x, y, z );

		this.screen    = Number3D.ZERO;
		this.visible   = false;
	}
}