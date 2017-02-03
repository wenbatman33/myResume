
class org.papervision3d.core.Number3D
{
	/**
	* The horizontal coordinate value.
	*/
	public var x: Number;

	/**
	* The vertical coordinate value.
	*/
	public var y: Number;

	/**
	* The depth coordinate value.
	*/
	public var z: Number;


	/**
	* Creates a new Number3D object whose three-dimensional values are specified by the x, y and z parameters. If you call this constructor function without parameters, a Number3D with x, y and z properties set to zero is created.
	*
	* @param	x	The horizontal coordinate value. The default value is zero.
	* @param	y	The vertical coordinate value. The default value is zero.
	* @param	z	The depth coordinate value. The default value is zero.
	*/
	public function Number3D( x: Number, y: Number, z: Number )
	{
		this.x = x || 0;
		this.y = y || 0;
		this.z = z || 0;
	}


	/**
	* Returns a new Number3D object that is a clone of the original instance with the same three-dimensional values.
	*
	* @return	A new Number3D instance with the same three-dimensional values as the original Number3D instance.
	*/
	public function clone():Number3D
	{
		return new Number3D( this.x, this.y, this.z );
	}


	/**
	* Returns a Number3D object with x, y and z properties set to zero.
	*
	* @return A Number3D object.
	*/
	static public function get ZERO():Number3D
	{
		return new Number3D( 0, 0, 0 );
	}


	/**
	* Returns a string value representing the three-dimensional values in the specified Number3D object.
	*
	* @return	A string.
	*/
	public function toString(): String
	{
		return 'x:' + x + ' y:' + y + ' z:' + z;
	}
}