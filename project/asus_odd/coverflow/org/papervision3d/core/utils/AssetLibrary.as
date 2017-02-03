
// ______________________________________________________________________
//                                                           AssetLibrary

import flash.display.BitmapData;

import org.papervision3d.Papervision3D;
import org.papervision3d.materials.MovieMaterial;

class org.papervision3d.core.utils.AssetLibrary
{
	static private var __assetList :Object = new Object();
	
	//function AssetLibrary()	{}

	static public function getAsset( id:String )
	{
		return __assetList[ id ];
	}


	static public function addAsset( id:String, asset ):Number
	{
		var entry:Object = __assetList[ id ];

		if( entry )
		{
			entry.count++;
		}
		else
		{
			entry = new Object();
			entry.asset = asset;
			entry.count = 1;
			__assetList[ id ] = entry;
		}
		return entry.count;
	}


	static public function subAsset( id:String ):Number
	{
		var entry:Object = __assetList[ id ];

		if( entry.count )
		{
			entry.count--;

			if( entry.count == 0 )
			{
				disposeAsset( entry.asset );
				delete entry;
				return 0;
			}
			else return entry.count;
		}
		else return -1;
	}
	
	static public function cleanup()
	{
		for( var i:String in __assetList )
		{
			disposeAsset( __assetList[i].asset );
			delete __assetList[i];
		}

		__assetList = new Object();
		
		MovieMaterial.disposeBitmaps();

		Papervision3D.log( "Papervision3D AssetLibrary.cleanup" );
	}

	static private function disposeAsset( asset )
	{
		if( typeof( asset ) == "movieclip" )
		{
			asset.removeMovieClip();
		}
		else if( asset instanceof BitmapData )
		{
			asset.dispose();
		}
		else
		{
			Papervision3D.log( "Papervision3D AssetLibrary.disposeAsset ERROR" );
		}
	}
}