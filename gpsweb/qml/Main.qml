/*
 * Copyright (C) 2023  Felix Terrence
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * gpsweb is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtPositioning 5.2
import QtWebEngine 1.6
import QtWebChannel 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'gpsweb.felixterrence'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('DoorloopGPSOpWeb')
        }

        Component.onCompleted:{
            webkanaal.registerObject("hetQtObject", hetQtObject)
        }

        Label {
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            text: i18n.tr('Hello World!')

            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }
        QtObject{
            id: hetQtObject
            property double longwv: gpsposition.position.coordinate.longitude
            property double latwv: gpsposition.position.coordinate.latitude
            signal onRefresh()
            onLongwvChanged:onRefresh()
            onLatwvChanged:onRefresh()
        }
        WebEngineView{
            url: "index.html"
            webChannel: webkanaal
            anchors {
                fill: parent 
                topMargin: header.height
            }
        }
        WebChannel{
            id: webkanaal


        }
        PositionSource{
            id: gpsposition
            active: true
            
            preferredPositioningMethods: PositionSource.SatellitePositioningMethods
            updateInterval:1000
            
            onPositionChanged:{
                console.log(gpsposition.position.coordinate.latitude)
                console.log(gpsposition.position.coordinate.longitude)
            }
        }
    }
}
