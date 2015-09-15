ObjectiveSites.configure do

  objective "Nikon AF-S DX Nikkor 18-200mm 1:3,5-5,6 ED VR II",
            :url =>
            "http://www.guenstiger.de/Produkt/Nikon/AF_S_DX_Nikkor_18_200mm_1_3_5_5_6_G_ED_VR_II.html",
            :focus => "18-200",
            :vendor => "Nikon",
            :aperture => "3.5-3.6"
            
  objective "Nikon AF-S DX NIKKOR 35 mm 1:1,8 G",
              :url =>
            "http://www.guenstiger.de/Produkt/Nikon/AF_S_DX_NIKKOR_35_mm_1_1_8_G.html",
              :focus => "35",
              :vendor => "Nikon",
              :aperture => "1.8"
  
end

Default.configure do

  directory "/home/tim/.objectivePrice"

  mail :to => "tim+objective@emrys-merlin.de",
    :from => "ObjectivePrice <tim@emrys-merlin.de>",
    :subject => "ObjectivePrice has detected a price drop",
    :server => "emrys-merlin.de",
    :opening => "Hi Tim,\n\n" +
                "Just a short table of drops:\n\n",
    :closing => "Best regards,\n" +
                "Your ObjectivePrice-Script"

end
