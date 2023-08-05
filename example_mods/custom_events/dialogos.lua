function onEvent(Name, value1, value2)
    if Name == "dialogos" then
        makeLuaText("dialogo", "", 0, 200, 500)
        setTextAlignment("dialogo", 'center')
        setTextString("dialogo", value1)
        setTextSize("dialogo", 32)
        setObjectCamera("dialogo", "other")
        if value2 == "true" then
            addLuaText("dialogo")
        else if value2 == "false" then
            removeLuaText("dialogo")
        end
    end
    if songName == "Me-asuste" then
        setTextColor("dialogo", "FFCF7A")
    elseif songName == "durabox" then
        setTextColor("dialogo", "FFFF00")
    end
    end
end