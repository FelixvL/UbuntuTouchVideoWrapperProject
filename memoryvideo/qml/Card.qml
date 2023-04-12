
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3

Item{
    width: parent.width/3
    height: parent.height/4
    property string imagesrc
    UbuntuShape{
        anchors.fill:parent
        sourceFillMode: Image.PreserveAspectCrop
        source: Image{
            source: imagesrc
        }
    }
}

