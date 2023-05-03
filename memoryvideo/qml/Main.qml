/*
 * Copyright (C) 2023  Felix Sander
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * memoryvideo is distributed in the hope that it will be useful,
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
    applicationName: 'memoryvideo.memoryvideo'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)
    property int aantal : 0
    property Card othercard
    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Video Memory')
            visible: false
        }

        Grid{
            anchors.fill: parent
            columns: 3
            rows: 4
            
            Card{
                id: one
                imagesrc:"images/pexels-simon-berger-698275.jpg"
            }
            Card{
                id: two
                imagesrc:"images/pexels-david-bartus-1166209.jpg"
            }
            Card{
                id: three
                imagesrc:"images/pexels-dom-gould-325807.jpg"
            }
            Card{
                id: four
                imagesrc:"images/pexels-jaime-reimer-2662116.jpg"
            }
            Card{
                id: five
                imagesrc:"images/pexels-trace-hudson-2535207.jpg"
            }
            Card{
                id: six
                imagesrc:"images/pexels-stein-egil-liland-1933316.jpg"
            }
            Card{
                id: seven
                imagesrc:"images/pexels-trace-hudson-2535207.jpg"
            }
            Card{
                id: eight
                imagesrc:"images/pexels-jaime-reimer-2662116.jpg"
            }
            Card{
                id: nine
                imagesrc:"images/pexels-simon-berger-698275.jpg"
            }
            Card{
                id: ten
                imagesrc:"images/pexels-dom-gould-325807.jpg"
            }
             Card{
                id: eleven
                imagesrc:"images/pexels-david-bartus-1166209.jpg"
            }
            Card{
                id: twelve
                imagesrc:"images/pexels-stein-egil-liland-1933316.jpg"
            }
        }
    }
    function evenAmountClicked(card){
        
        aantal++;
        console.log(aantal)
        if(aantal == 1){
            othercard = card
            console.log("cid"+card.cardnumber);
            return false
        }else{
            return true
        }
    }
}
