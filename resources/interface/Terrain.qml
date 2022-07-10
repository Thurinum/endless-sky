import QtQuick 2.15
import QtQuick.Shapes 1.15
import Qt5Compat.GraphicalEffects
import Qt.labs.settings 1.0


Shape {
	id: root 
	
	width: 1024
	height: parent.height / 2
	
	property point start
	property int resolution: 4
	
	ShapePath {
		id: path
		strokeWidth: 4
		strokeColor: "green"
		fillColor: "green"
		fillRule: ShapePath.WindingFill
		// joinStyle: ShapePath.RoundJoin
		
		startX: 0; startY: 100
		
		PathCurve {
			x: root.start.x
			y: root.start.y
		}
		
	}
	
	property var del: PathCurve {
		x: 1024
		y: 1024
	}
		
	Instantiator {
		model: root.resolution
		onObjectAdded: (object) => {
			path.pathElements.push(object)
			
		}
		
		delegate: PathCurve {
			x: index * (root.width / root.resolution)
			y: -(root.height * Math.random())
		}
		
	}
	
	
}
