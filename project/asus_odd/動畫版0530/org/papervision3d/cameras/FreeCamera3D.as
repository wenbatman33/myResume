

// ______________________________________________________________________
//                                              DisplayObject3D: Camera3D
import org.papervision3d.core.proto.CameraObject3D;

/**
* The CameraObject3D class.
*
*/
class org.papervision3d.cameras.FreeCamera3D extends CameraObject3D
{
	// __________________________________________________________________________
	//                                                                      N E W
	// NN  NN EEEEEE WW    WW
	// NNN NN EE     WW WW WW
	// NNNNNN EEEE   WWWWWWWW
	// NN NNN EE     WWW  WWW
	// NN  NN EEEEEE WW    WW

	/**
	* The Camera3D constructor lets you set up the view of a scene that will be rendered.
	*
	* Its position can be specified in the initObject. The default value of z is DEFAULT_Z.
	*
	* @param	zoom		[optional] - This value specifies the scale at which the 3D objects are rendered. Higher values magnify the scene, compressing distance. Use it in conjunction with focus. The default value is 2.
	* <p/>
	* @param	focus		[optional] - This value is a positive number representing the distance of the observer from the front clipping plane, which is the closest any object can be to the camera. Use it in conjunction with zoom. The default value is 100.
	* <p/>
	* @param	initObject	[optional] - An object that contains user defined properties with which to populate the newly created DisplayObject3D.
	* <p/>
	* It includes x, y, z, rotationX, rotationY, rotationZ, scaleX, scaleY scaleZ and a user defined data object.
	* <p/>
	* If data is not an object, it is ignored. All properties of the data field are copied into the new instance. The properties specified with data are publicly available.
	*
	* <ul>
	* <li><b>sort</b>: A Boolean value that determines whether the 3D objects are z-depth sorted between themselves when rendering. The default value is true.</li>
	* </ul>
	*/
	public function FreeCamera3D( zoom:Number, focus:Number, initObject:Object )
	{
		super( zoom, focus, initObject );
	}
}