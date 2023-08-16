/*
 * Copyright (C) 2023  Sander Terrence Felix
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * apicallvideo is distributed in the hope that it will be useful,
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
import "fetch.js" as Fetch
MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'apicallvideo.stf'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('API Call Video')
        }

        TextArea {
            id: resultText
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            text: i18n.tr('Press the button to show a random Cat Fact')

            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }
        Button{
            text: 'Give me a cat fact'
            anchors{
                bottom:parent.bottom
            }
            onClicked:{
                getCatFactFetch();
            }
        }
    }
    function getCatFactFetch(){
        console.log("fetch started");
        Fetch.fetch("https://catfact.ninja/fact")
        .then(r => r.json())
        .then(d => resultText.text = d.fact)
    }
}
