import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
Popup
{

    id: popupUpdatePassword;
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    modal: true;
    focus: true;

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2


    width : appWindow.width  * .7;
    height: appWindow.height / 5;
    opacity: 0.5;
    background: Rectangle{
        color: "white";
        radius: 15;
    }


    Text {
        id: dipslayMessage;
        width: parent.width *.9;
        height: parent.height;
        anchors.centerIn: parent;
        text: qsTr("");
        wrapMode: Text.WordWrap;
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

    }

    signal popupClosing();

    // Koşullu olarak Görünür yapmak için
    // T: RESET MAİLİ GÖNDERİLDİ
    // F: KULLANICI KAYITLI DEĞİL.
    function showCase(pCase)
    {
        if (pCase)
        {
            dipslayMessage.text = qsTr("Şifre yenileme işlemi başarı ile gerçekleşmiştir.");
        }
        else
        {
            dipslayMessage.text = qsTr("Girmiş olduğunuz şifre yenileme kodu yanlıştır.\n Lütfen tekrar deneyiniz")
        }

        visible = true;
    }


    NumberAnimation {
        id: popupAnimator;
        target: popupUpdatePassword
        property: "opacity"
        duration: appWindow.scrollTopInterval;
        from: 0.5;
        to: 1;
        easing.type: Easing.InOutQuad

    }

    onVisibleChanged:
    {
        if (visible)
        {
            popupAnimator.start();
        }
        else
        {
            opacity = 0.5;
        }
    }
}
