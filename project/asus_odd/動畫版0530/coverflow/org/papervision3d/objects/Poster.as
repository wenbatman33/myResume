class org.papervision3d.objects.Poster extends org.papervision3d.objects.Plane
{
	var scale, vertices;
	function Poster(material, scale, segmentsW, segmentsH, initObject)
	{
		super(material, scale * material.bitmap.width, scale * material.bitmap.height, segmentsW, segmentsH, initObject);
		this.scale = scale || org.papervision3d.objects.Poster.DEFAULT_SCALE;
	}
	function transformScale(scale)
	{
		var _loc3 = scale / this.scale;
		for (var _loc4 in vertices) {
			var _loc2 = vertices[_loc4];
			_loc2.x = _loc2.x * _loc3;
			_loc2.y = _loc2.y * _loc3;
			_loc2.z = _loc2.z * _loc3;
		}
		this.scale = scale;
	}
	static var DEFAULT_SCALE = 1;
}
