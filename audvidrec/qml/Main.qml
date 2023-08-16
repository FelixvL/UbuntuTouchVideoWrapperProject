/*
 * Copyright (C) 2023  Sander Felix
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * audvidrec is distributed in the hope that it will be useful,
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
    applicationName: 'audvidrec.sanderfelix'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)
    Audio{
        id:audio
        source: "Ubuntu.ogg"
    }
    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Audio VideoRecording')
        }

        Row{
            anchors{
                fill : parent
                topMargin : header.height
            }
            Button{
                text:'play'
                onClicked:{
                    console.log("in play")
                    audio.play()
                }
            }
            Button{
                text:'pause'
                onClicked:{
                    audio.pause()
                }
            }
            Button{
                text:'stop'
                onClicked:{
                    audio.stop()
                }
            }
        }
    }
}
