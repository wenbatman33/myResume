import flash.display.BitmapData;
import flash.geom.*;
import mx.utils.Delegate;
import org.papervision3d.materials.BitmapMaterial;
import org.papervision3d.materials.MovieMaterial;
import org.papervision3d.materials.ColorMaterial;
import org.papervision3d.Papervision3D;
import org.papervision3d.scenes.MovieScene3D;
import org.papervision3d.scenes.Scene3D;
import org.papervision3d.cameras.Camera3D;
import org.papervision3d.objects.Plane;
import org.papervision3d.objects.Collada;
import org.papervision3d.materials.BitmapAssetMaterial;
import org.papervision3d.core.proto.DisplayObject3D;
import caurina.transitions.*;
import mx.events.EventDispatcher;
import flash.filters.ColorMatrixFilter;

class Coverflow extends MovieClip
{
	public var rootpath  	:MovieClip;
	public var MovMC		:MovieClip;
	
	public var tit0		    :MovieClip;
	public var tit1		    :MovieClip;
	public var tit2		    :MovieClip;
	public var tit3		    :MovieClip;
	
	private var containerMC	:MovieClip;
	
	private var scene			:MovieScene3D;
	private var camera			:Camera3D;		
	
	private var mcl				:MovieClipLoader;	
	private var loadedIndex		:Number = 0;
	private var itemOfNumber	:Number = 3;
	private var plane_array		:Array;
	private var mcl_array		:Array;	
	
	private var planeWidth		:Number = 379;
	private var planeHeight 	:Number = 240;
	
	public var currentPlaneIndex	:Number = 0;
	
	private var selectPlaneZ		:Number = -180;	
	private var planeAngle			:Number = 65;
	private	var planeSeparation		:Number = 65;
	private var planeOffset			:Number = 300;
	
	private var tweenTime			:Number = 0.8;
	private var transition			:String = "easeOutExpo";
	
	private var msg_txt				:TextField;

	private var isRender			:Boolean = true;
	public function Coverflow()
	{
		
		plane_array = new Array();
		mcl_array = new Array();
		mcl = new MovieClipLoader();
		mcl.addListener(this);
		init3D();		
		loadNextIMG();
		this.onEnterFrame = onRender3D;
		
	}	
	private function init3D():Void
	{		
		containerMC = this.createEmptyMovieClip("containerMC", this.getNextHighestDepth());
		containerMC._x =1104/2;
		containerMC._y =640/2
		containerMC.cacheAsBitmap = true;
		scene = new MovieScene3D(containerMC);
		
		camera = new Camera3D();
		camera.x = 0;
		camera.y = 0;
		camera.zoom = 1;
		camera.focus = 500;			
		camera.z = -200;		
	
	}
	private function loadNextIMG():Void
	{
		if (loadedIndex > itemOfNumber) {
			shiftToItem(1);
				shiftToItem(0);
			Mouse.addListener(this);
			for (var a:String in mcl_array) {
				mcl_array[a].removeMovieClip();
			}
			msg_txt.text = "";
			return;
		}
		var _emptyMC:MovieClip =  this.createEmptyMovieClip("_emptyMC" + loadedIndex, this.getNextHighestDepth());
		MovMC.swapDepths(this.getNextHighestDepth())
		//mcl.loadClip("images/" + loadedIndex + ".jpg", _emptyMC);
		mcl.loadClip("images/coverflow_pic"+loadedIndex+".jpg", _emptyMC);
		mcl_array.push(_emptyMC);
		//msg_txt.text = loadedIndex + "/" + itemOfNumber;		
		
		
		
		rootpath=this
	}
	private function onEventRelease(e:Object):Void
	{		
		shiftToItem(e.id);		
	}
	private function addZero(num):String
	{
		if (num < 10) {
			return "0" + num;
		}
		return String(num);
	}
	public function shiftToItem(p_id:Number):Void
	{
		
		MovMC.unloadMovie();
		isRender = true;
		msg_txt.text = p_id.toString();
		if (currentPlaneIndex == p_id) 	return;
		for (var i:Number = 0; i < plane_array.length; i++) {			
				
			var plane:Plane = plane_array[i];							
			if (i >= p_id - 1 && i <= p_id + 1) {				
				plane.material.smooth = true;
			} else {
				plane.material.smooth = false;					
			}
			var dis	:Number = i - p_id;
			//plane.container._alpha = 20;
			if (i == p_id) {
				//plane.container.filters = [];
				Tweener.addTween(plane,
				{
					x			: 0,
					z			: selectPlaneZ,
					rotationY	: 0,
					time		:tweenTime, 
					transition	:transition,
					onComplete	:MOV_WH
					});																	
				
			} else if (i < p_id) {
				
				
				Tweener.addTween(plane,
				{
					x			:dis * planeSeparation - planeOffset, 					
					z			:Math.abs(dis) * 10,
					rotationY	:planeAngle,
					time		:tweenTime, 										 
					transition	:transition 
				});
				
			} else  {
				
				Tweener.addTween(plane,
				{
					x			:dis * planeSeparation + planeOffset, 
					z			:Math.abs(dis) * 10,
					rotationY	: -planeAngle,
					time		:tweenTime, 
					transition	:transition
				});						
			}				
		}			
		currentPlaneIndex = p_id;		
	}
	public function MOV_WH():Void {	
	
		
		//var tempNum=_level0.currentPlaneIndex
		//var temp:MovieClip = _level0.MovMC;
		
		var tempNum=_level10.currentPlaneIndex
		var temp:MovieClip = _level10.MovMC;
		
	
		
		
			_level10.tit0.gotoAndStop(1);
			_level10.tit1.gotoAndStop(1);
			_level10.tit2.gotoAndStop(1);
			_level10.tit3.gotoAndStop(1);
			_level10["tit" + tempNum].gotoAndPlay(2);

	
		
		temp.attachMovie("Mov_" + tempNum, "Mov_" + tempNum, 0);
		temp._width = 363;
		temp._height = 304;
		isRender = false;
	}
	
	private function onLoadInit(mc:MovieClip):Void
	{
		var bmp:BitmapData = new BitmapData(mc._width, mc._height, false, 0);
		bmp.draw(mc);		
		mc._visible = false;				
		
		var newWidth	:Number;
		var newHeight	:Number;
		
		if (bmp.width > bmp.height) {
			newWidth = planeWidth;
			newHeight = bmp.height/bmp.width * planeWidth;
			} else {
			newWidth = bmp.width/bmp.height *  planeHeight;
			newHeight = planeHeight;				
		}
		
		
		var bmp:BitmapData = getRefBMP(mc);
		var mat:BitmapMaterial = new BitmapMaterial(bmp);
		var plane:Plane = new Plane(mat, newWidth, newHeight, 2, 20);
		plane.material.oneSide = false;
		plane.y = planeHeight/2;		
		plane.z = loadedIndex * -2;
		plane.extra = {id : loadedIndex};
		scene.push( plane );
		plane_array.push(plane);
				
		var _mc:MovieClip = plane.container;
		EventDispatcher.initialize(_mc);
		
		_mc.onRelease = function():Void
		{		
			this.dispatchEvent( 
			{ 
				target	:this,
				id		:this.displayObject3D.extra.id,
				type	:"onEventClick"
			});
		}
		_mc.addEventListener("onEventClick",  Delegate.create(this, onEventRelease));		
		++loadedIndex;
		loadNextIMG();
	}
	public function moveLeft():Void{			
		if (currentPlaneIndex > 0) 	shiftToItem(currentPlaneIndex-1);			
	}			
	public function moveRight():Void{
		if (currentPlaneIndex < itemOfNumber ) shiftToItem(currentPlaneIndex + 1);			
	}
	private function getRefBMP(mc:MovieClip):BitmapData{		

		var _bmp:BitmapData = new BitmapData(mc._width, mc._height-10, true, 0);
		_bmp.draw(mc);
		return _bmp;
	}
	private function onRender3D():Void
	{	
		if (!isRender) return;		
		scene.renderCamera(camera);
	}
}
