// Original code from juxtinteractive.com

class org.papervision3d.core.utils.XML2Object
{
	public var data:Object;
	public var ok:Boolean;

	private var _callBack:Function;

	public function XML2Object( url:String, callBack:Function )
	{
		var o = this;

		var dataXML = new XML();
		dataXML.ignoreWhite = true;

		dataXML.onLoad = function( ok:Boolean )
		{
			o.data = o.parseObject( this );
			o.ok = ok;
			o._callBack();
		};

		ok = false;
		_callBack = callBack;

		dataXML.load( url );
	}


	function parseObject( oXML:XML ):Object
	{
		var obj = new Object();

		if( oXML == null )
			return obj;

		//--- Step past the root element to the first ARRAY node ---
		var eRoot = oXML.firstChild;

		//--- Start with the first node ---
		if (eRoot != null)
			obj = buildObject(obj, eRoot);

		return obj;
	}


	//-------------------------------------------------------------------
	// Purpose: Called by XMLDocToObject() function, to recursively build
	//			the object from the XML document.
	//-------------------------------------------------------------------
	function buildObject( obj:Object, eItem:XMLNode )
	{

		var XML_NODE_TYPE_TEXT = 3;
		var XML_NODE_TYPE_ELEMENT = 1;
		var idx, eChild;
		var oTarget;


		//--- Loop through the sibling elements in this level of the XML ---
		while (eItem != null) {
			idx = eItem.nodeName;

			if (eItem.nodeType == XML_NODE_TYPE_ELEMENT) {

				//
				//--- Recursively process any other child nodes ---
				oTarget = buildObject( {}, eItem.firstChild);


				//
				//--- Process any XML node attributes ---
				for (var attrib in eItem.attributes) {
					oTarget[attrib] = eItem.attributes[attrib];
				}

				//
				//--- Check the first child, and see if it's a simple text node ---
				if (eItem.nodeValue != null) {
					//--- Save the value from the TEXT element into the object ---
					oTarget._value = eItem.nodeValue;
				} else {
					eChild = eItem.firstChild;
					if (eChild != null) {
						if (eChild.nodeType == XML_NODE_TYPE_TEXT) {
							if (eChild.nodeValue != null) {
								//--- Save the value from the TEXT element into the object ---
								oTarget._value = eChild.nodeValue;
							}
						}
					}
				}

				//
				//--- If there are duplicate nodenames, convert them to an array ---
				if (obj[idx] != null) {
					if (obj[idx]._type != 'array') {
					//	oTarget = new Array();
					//	oTarget[0] = obj[idx];
					//	obj[idx] = oTarget;

						obj[idx] = [ obj[idx] ];
						obj[idx]._type = 'array';
						obj[idx][1] = oTarget;
					} else {
						obj[idx][ obj[idx].length ] = oTarget;
					}
				} else {
					obj[idx] = oTarget;
				}

				// 99: Duplicate brach if attribute "id"
				var useId = eItem.attributes.id;

				if( useId != null )
				{
					obj[useId] = oTarget;
				}

			}	//*** END OF: if (eItem.nodeType == XML_NODE_TYPE_ELEMENT) ***



			//-- Get the next sibling node in this level of the XML ---
			eItem = eItem.nextSibling;

		}	//*** END OF: while(eItem != null) ***

		return obj;
	}
}