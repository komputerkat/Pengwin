#!/bin/bash

if [[ "$1" == "release" ]]; then
  export OLD='-dev'
  export NEW=''
else
  export OLD=''
  export NEW='-dev'
fi

curl -s "https://packagecloud.io/install/repositories/whitewaterfoundry/pengwin-base${NEW}/script.deb.sh" | sudo env os=debian dist=buster bash
curl -s "https://packagecloud.io/install/repositories/whitewaterfoundry/pengwin-setup${NEW}/script.deb.sh" | sudo env os=debian dist=buster bash

sudo sed -i "s\$/pengwin-setup${OLD}/\$/pengwin-setup${NEW}/\$g" /etc/apt/sources.list.d/whitewaterfoundry.list
sudo sed -i "s\$/pengwin-base${OLD}/\$/pengwin-base${NEW}/\$g" /etc/apt/sources.list.d/whitewaterfoundry.list

sudo rm /etc/apt/sources.list.d/whitewaterfoundry_pengwin-*
