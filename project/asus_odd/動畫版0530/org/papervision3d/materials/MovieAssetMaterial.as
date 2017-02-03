
// __________________________________________________________________________ MOVIE ASSET MATERIAL

import org.papervision3d.core.utils.AssetLibrary;
import org.papervision3d.materials.MovieMaterial;

import flash.display.BitmapData;


/**
* The MovieAssetMaterial class creates a texture from a MovieClip library symbol.
*
* The texture can be animated and/or transparent.
*
* The MovieClip's content needs to be top left aligned with the registration point.
*
* A material is extra that you assign to objects or faces, so that they appear a certain way when rendered. Materials affect the line and fill colors.
*
* Materials create greater realism in a scene. A material describes how an object reflects or transmits light. You assign materials to individual objects or a selection of faces; a single object can contain different materials.
*
*/
class org.papervision3d.materials.MovieAssetMaterial extends MovieMaterial
{

	// ______________________________________________________________________ NEW

	/**
	* The MovieAssetMaterial class creates a texture from a MovieClip library id.
	*
	* @param	id					The linkage name of the MovieClip symbol in the library.
	* @param	transparent			[optional] - If it's not transparent, the empty areas of the MovieClip will be of fill32 color. Default value is false.
	* @param	initObject			[optional] - An object that contains additional properties with which to populate the newly created material.
	*/

	function MovieAssetMaterial( id:String, transparent:Boolean, attachedMovieContainer:MovieClip, initObject:Object )
	{
		super( id, transparent, initMovieContainer( attachedMovieContainer, initObject ) );
	}


	// ______________________________________________________________________ CREATE BITMAP

	private function createBitmap( asset:String ):BitmapData
	{
		// Remove previous bitmap
		if( this._texture != asset )
		{
			var prevMovie:MovieClip = AssetLibrary.getAsset( this._texture );

			if( AssetLibrary.subAsset( this._texture ) == 0 )
				prevMovie.removeMovieClip();
		}

		// Retrieve from library or...
		var movie:MovieClip = AssetLibrary.getAsset( asset );

		// ...attachMovie
		if( ! movie )
		{
			movie = movieContainer.attachMovie( asset, asset, movieContainer.getNextHighestDepth() );

			if( movie )
			{
				// Movie attached ok
				movie._x = 99999;
				movie._y = 99999;
				movie._visible = false;
			}
		}

		// Add to library
		AssetLibrary.addAsset( asset, movie );

		// Create Bitmap
		return super.createBitmap( movie );
	}


	// ______________________________________________________________________ PRIVATE

	private function initMovieContainer( container:MovieClip, initObject:Object ):Object
	{
		container = container || _root; // Dodgy, but we've got to attach somewhere! Any ideas welcome.

		movieContainer = container.createEmptyMovieClip( "movieContainer", container.getNextHighestDepth() );

		// Hide it
		movieContainer._x = 99999;
		movieContainer._y = 99999;
		movieContainer._visible = false;

		return initObject;
	}


	// ______________________________________________________________________ PRIVATE VAR

	static private var movieContainer :MovieClip;
}