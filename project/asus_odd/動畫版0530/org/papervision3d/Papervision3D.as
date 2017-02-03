class org.papervision3d.Papervision3D
{
	// __________________________________________________________________________
	//                                                                     STATIC

	static public var NAME     :String = 'Papervision3D';
	static public var VERSION  :String = 'Beta RC0';
	static public var DATE     :String = '24.05.07';
	static public var AUTHOR   :String = '(c) 2006-2007 Copyright by Carlos Ulloa | papervision3d.org | carlos@papervision3d.org';

	static public var VERBOSE  :Boolean = true;

	// ___________________________________________________________________________________________________
	//                                                                           P A P E R V I S I O N 3 D
	// NN  NN EEEEEE WW    WW
	// NNN NN EE     WW WW WW
	// NNNNNN EEEE   WWWWWWWW
	// NN NNN EE     WWW  WWW
	// NN  NN EEEEEE WW    WW

	/**
	* The Papervision3D class lets you create, manipulate and display 3D objects.
	*/
	public function Papervision3D()
	{
		log( "Papervision3D scene class has been replaced by org.papervision3d.scenes" );
	}


	static public function log( message:String )
	{
		if( Papervision3D.VERBOSE )
			trace( message );
	}
}