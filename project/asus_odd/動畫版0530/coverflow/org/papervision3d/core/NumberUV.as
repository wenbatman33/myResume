
class org.papervision3d.core.NumberUV
{
	/**
	* The horizontal coordinate value.
	*/
	public var u: Number;

	/**
	* The vertical coordinate value.
	*/
	public var v: Number;

	/**
	* Creates a new NumberUV object whose coordinate values are specified by the u and v parameters. If you call this constructor function without parameters, a NumberUV with u and v properties set to zero is created.
	*
	* @param	u	The horizontal coordinate value. The default value is zero.
	* @param	v	The vertical coordinate value. The default value is zero.
	*/
	public function NumberUV( u: Number, v: Number )
	{
		this.u = u || 0;
		this.v = v || 0;
	}


	/**
	* Returns a new NumberUV object that is a clone of the original instance with the same UV values.
	*
	* @return	A new NumberUV instance with the same UV values as the original NumberUV instance.
	*/
	public function clone():NumberUV
	{
		return new NumberUV( this.u, this.v );
	}


	/**
	* Returns a NumberUV object with u and v properties set to zero.
	*
	* @return A NumberUV object.
	*/
	static public function get ZERO():NumberUV
	{
		return new NumberUV( 0, 0 );
	}


	/**
	* Returns a string value representing the UV values in the specified NumberUV object.
	*
	* @return	A string.
	*/
	public function toString(): String
	{
		return 'u:' + u + ' v:' + v;
	}
}