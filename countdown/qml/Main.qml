/*
 * Copyright (C) 2023  Video Team
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * countdown is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'countdown.videoteam'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('CountDown')
        }
        TextField{
            id:inputField
            anchors{
                top: header.bottom
                left: parent.left
                right: parent.right
            }
        }
        Button{
            text:'Start'
            anchors{
                top:inputField.bottom
            }
            onClicked:{
                timeLabel.text = inputField.text
                countdown.start()
            }
        }
        Label {
            id:timeLabel
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
        Timer{
            id:countdown
            running:false
            repeat:false
            interval:1000
            onTriggered:{
                var time = timeLabel.text
                time--
                timeLabel.text = time
                if(time < 1){
                    timeLabel.text = 'Time is up!!'
                    return
                }
                countdown.start()
            }
        }
    }
}
