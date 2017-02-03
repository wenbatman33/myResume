﻿

// ______________________________________________________________________
//                                                          SceneObject3D

import org.papervision3d.core.proto.CameraObject3D;
import org.papervision3d.core.proto.DisplayObject3D;
import org.papervision3d.core.proto.MaterialObject3D;
import org.papervision3d.Papervision3D;

/**
* Scene3D
* The Scene3D class lets you create, manipulate and display 3D objects.
*
*/
class org.papervision3d.core.proto.SceneObject3D
{
	// __________________________________________________________________________
	//                                                                     STATIC

	/**
	* The MovieClip that you draw into when rendering.
	*/
	public var container :MovieClip;


	/**
	* An object that contains total and current statistics.
	* <ul>
	* <li>points</li>
	* <li>polys</li>
	* <li>triangles</li>
	* <li>performance<li>
	* <li>rendered<li>
	* </ul>
	*/
	public var stats :Object;

	/**
	* It contains a list of DisplayObject3D objects in a scene.
	*/
	public var objects :Array;

	/**
	* It contains a list of Material3D materials in a scene.
	*/
	public var materials :Array;

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
	* @param	container	The MovieClip that you draw into when rendering. If not defined, each object must have it's own private container.
	*
	*/
	public function SceneObject3D( container:MovieClip )
	{
		if( container )
			this.container = container;
		else
			Papervision3D.log( "Scene3D: container argument required." );

		this.objects = new Array();
		this.materials = new Array();

		Papervision3D.log( Papervision3D.NAME + " " + Papervision3D.VERSION + " (" + Papervision3D.DATE + ")\n" );

		stats = new Object( { points:0, polys:0, triangles:0, performance:0, rendered:0 } );
	}

	// ___________________________________________________________________________________________________
	//                                                                                             P U S H
	// PPPPP  UU  UU  SSSSS HH  HH
	// PP  PP UU  UU SS     HH  HH
	// PPPPP  UU  UU  SSSS  HHHHHH
	// PP     UU  UU     SS HH  HH
	// PP      UUUU  SSSSS  HH  HH

	/**
	* Includes an DisplayObject3D or a Material3D element in the scene.
	*
	* @param	sceneElement	Element to add.
	*/
	public function push( sceneElement )
	{
		if( sceneElement instanceof DisplayObject3D )
		{
			this.objects.push( sceneElement );
			sceneElement.scene = this;
		}
		else if( sceneElement instanceof MaterialObject3D )
		{
			this.materials.push( sceneElement );
			sceneElement.scene = this;
		}
		else Papervision3D.log( "SceneObject3D.push(): Object not recognized. Must be Material3D or DisplayObject3D descendants.");
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
	public function renderCamera( camera :CameraObject3D )
	{
		// Render performance stats
		var stats:Object  = this.stats;
		stats.performance = getTimer();

		// Materials
		var m         :MaterialObject3D;
		var materials :Array  = this.materials;
		var i         :Number = materials.length;

		while( m = materials[--i] )
			if( m.animated )
				m.updateBitmap();

		// 3D projection
		if( camera )
		{
			// Transform camera
			camera.transform();

			// Project objects
			var objects :Array = this.objects;
			var p :DisplayObject3D;

			i = objects.length;
			while( p = objects[--i] )
				if( p.visible )
					p.project( camera );
		}

		// Z sort
		var sort :Boolean = camera.sort;
		if( sort )
			this.objects.sortOn( 'screenZ', Array.ASCENDING | Array.NUMERIC );

		// Render objects
		stats.rendered = 0;
		renderObjects( sort );
	}

	private function renderObjects() {}
}