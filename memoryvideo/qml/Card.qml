
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3

Item{

    width: parent.width/3
    height: parent.height/4
    property string imagesrc
    property bool flipped : false
    property string cardnumber
    
    MouseArea{
        anchors.fill:parent
        
        onClicked:{
            var evena = evenAmountClicked(cardnumber)
            console.log(evena)
            if(evena){
                flipped=true
                tijd.start()
                console.log("wegsturen "+cardnumber)
                return                    
            }
            flipped=true

        }
    }
    Timer{
        id:tijd
        interval:3000
        running:false
        onTriggered:{
            console.log("timer voorbij"+cardnumber);
            flipped = false
            root.othercard.flipped = false
        }
    }
    UbuntuShape{
        anchors.fill:parent
        sourceFillMode: Image.PreserveAspectCrop
        source: Image{
            source: flipped?imagesrc:"images/image_1024.jpeg"
        }
    }
    
    
}

