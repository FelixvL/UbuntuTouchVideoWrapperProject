
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3

Item{
    id: card

    width: parent.width/3
    height: parent.height/4
    property string imagesrc
    property bool flipped : false
    
    MouseArea{
        anchors.fill:parent
        
        onClicked:{
            if(root.aantal >= 2) {
                return
            }
            flipped = !flipped
            if(flipped) {
                var evena = evenAmountClicked(card)
                console.log(evena)
                if(evena){
                    tijd.start()
                    console.log("wegsturen "+card.cardnumber)
                    return                    
                }
            }
        }
    }
    Timer{
        id:tijd
        interval:3000
        running:false
        onTriggered:{
            console.log("timer voorbij"+card.cardnumber);
            flipped = false
            root.othercard.flipped = false
            root.aantal = 0
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

