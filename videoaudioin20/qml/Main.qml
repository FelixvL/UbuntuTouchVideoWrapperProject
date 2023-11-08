/*
 * Copyright (C) 2023  f
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * videoaudioin20 is distributed in the hope that it will be useful,
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
import QtMultimedia 5.11


MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'videoaudioin20.fs'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)
   Audio{
        id: audio
        source: "Ubuntu.ogg"
        //source: "https://icecast.omroep.nl/radio1-bb-mp3"
    }
    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('videoaudioin20')
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
