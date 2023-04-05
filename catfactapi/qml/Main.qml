/*
 * Copyright (C) 2023  Felix Terrence
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * catfactapi is distributed in the hope that it will be useful,
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
import "fetch.js" as Fetch

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'catfactapi.felixterrence'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Demo APICallDoorloop')
        }

        TextArea {
            id:resultLabel
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: knop.top
            }
            text: i18n.tr('Hello World!')

            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }
        Button{
            id: knop
            anchors{
                bottom: parent.bottom
            }
            text: 'Toon API result'
            onTriggered:{
                resultLabel.text = 'yes'
                //getCondition()
                getInformation() // fetch werkt nog niet
            }
        }

    }
    function getCondition() {
        var request = new XMLHttpRequest()
        request.open('GET', 'https://catfact.ninja/fact', true);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    console.log("response", request.responseText)
                    var result = JSON.parse(request.responseText)
                    resultLabel.text = result.fact
                } else {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send()
    }
    // copy into file .js https://github.com/github/fetch/blob/master/fetch.js
    function getInformation(){
        console.log("==================");
        Fetch.fetch('https://catfact.ninja/fact')
        .then(r => r.json())
        .then(d => resultLabel.text = d.fact)
    }
}



