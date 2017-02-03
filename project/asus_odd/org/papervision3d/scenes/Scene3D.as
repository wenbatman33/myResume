
// ______________________________________________________________________
//                                                                Scene3D

import org.papervision3d.Papervision3D;
import org.papervision3d.core.proto.SceneObject3D;
import org.papervision3d.core.proto.DisplayObject3D;

/**
* Scene3D
* The Scene3D class lets you create, manipulate and display 3D objects.
*
*/
class org.papervision3d.scenes.Scene3D extends SceneObject3D
{
	// ___________________________________________________________________________________________________
	//                                                                           P A P E R V I S I O N 3 D
	// NN  NN EEEEEE WW    WW
	// NNN NN EE     WW WW WW
	// NNNNNN EEEE   WWWWWWWW
	// NN NNN EE     WWW  WWW
	// NN  NN EEEEEE WW    WW

	/**
	* The Papervision3D class lets you create, manipulate and display 3D objects.
	*
	* @param	container	The MovieClip that you draw into when rendering. If not defined, each object must have it's own individual container.
	*
	*/
	public function Scene3D( container:MovieClip )
	{
		super( container );
	}


	// ___________________________________________________________________________________________________
	//                                                                           R E N D E R   C A M E R A
	// RRRRR  EEEEEE NN  NN DDDDD  EEEEEE RRRRR
	// RR  RR EE     NNN NN DD  DD EE     RR  RR
	// RRRRR  EEEE   NNNNNN DD  DD EEEE   RRRRR
	// RR  RR EE     NN NNN DD  DD EE     RR  RR
	// RR  RR EEEEEE NN  NN DDDDD  EEEEEE RR  RR CAMERA

	/**
	* Generates an image from the camera's point of view and the active models of the scene.
	*
	* @param	camera		Camera3D object to render from.
	*/
	public function renderObjects( sort:Boolean )
	{
		// Clear scene container
		this.container.clear();

		var p       :DisplayObject3D;
		var objects :Array  = this.objects;
		var i       :Number = objects.length;

		while( p = objects[--i] )
			if( p.visible )
				p.render( this );

		// Update stats
		var stats:Object  = this.stats;
		stats.performance = getTimer() - stats.performance;
	}
}