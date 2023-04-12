/*
 * Copyright (C) 2023  FelixSander
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * audiovideo is distributed in the hope that it will be useful,
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
import QtMultimedia 5.11

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'audiovideo.felixsander'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)
    // https://doc.qt.io/qt-5/qml-qtmultimedia-audio.html
    Audio{
        id: audio
        //source: "Ubuntu.ogg"
        source: "https://icecast.omroep.nl/radio1-bb-mp3"
    }
    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Video Audio')
        }

        Row{
            anchors{
                fill:parent
                topMargin:header.height
            }
            Button{
                text:"Play"
                onClicked:{
                    audio.play()
                }
            }
            Button{
                text:"Pause"
                onClicked:{
                    audio.pause()
                }
            }
            Button{
                text:"Stop"
                onClicked:{
                    audio.stop()
                }
            }
        }
    }
}
