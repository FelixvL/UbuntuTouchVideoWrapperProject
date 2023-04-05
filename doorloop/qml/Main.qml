/*
 * Copyright (C) 2023  doorloop
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * doorloop is distributed in the hope that it will be useful,
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

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'doorloop.dorloop'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Doorloop')
        }
        Timer{
            id: countdown
            running: false
            repeat: false
            interval: 1000
            onTriggered:{
                var tijd = hetlabel.text
                tijd--
                hetlabel.text = tijd
                if(tijd < 1){
                    hetlabel.text = "Time is up"
                    return
                }
                countdown.start()
            }
        }

        TextField{
            id: theinput
            anchors{
                top: header.bottom
                left: parent.left
                right: parent.right
            }


        }
        Label {
            id: hetlabel
            anchors {
                centerIn: parent
            }
            text: ""
            textSize: Label.Large
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }
        Button{
            text: "Start"
            anchors{
                top: theinput.bottom
            }
            onClicked:{
                hetlabel.text = theinput.text
                countdown.start()
            }
        }
    }
}
