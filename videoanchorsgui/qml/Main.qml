/*
 * Copyright (C) 2023  videoanchorsgui
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * videoanchorsgui is distributed in the hope that it will be useful,
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
    applicationName: 'videoanchorsgui.videoanchorsgui'
    automaticOrientation: true
    anchorToKeyboard: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('videoanchorsgui')
        }

        TextField{
            id: textfield
            color: "red"
            placeholderText: "type your name"
            anchors{
                top: header.bottom
                topMargin: units.gu(2)
                left: parent.left
                leftMargin: units.gu(2)
                right: parent.right
                rightMargin: units.gu(2)      
            }
        }
        TextArea{
            anchors{
                top: textfield.bottom
                topMargin: units.gu(1)
                bottom: thebutton.top
                bottomMargin: units.gu(1)
                left: parent.left
                leftMargin: units.gu(2)
                right: parent.right
                rightMargin: units.gu(2)      
            }
        }
        Button{
            id : thebutton
            text: "click here"
            color: theme.palette.normal.negative
            anchors{
                left: parent.left
                leftMargin: units.gu(2)
                bottom: parent.bottom
                bottomMargin: units.gu(2)
            }
        }
    }
}
