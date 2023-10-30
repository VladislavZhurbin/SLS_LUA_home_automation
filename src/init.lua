telegram.settoken("API-token")   --API-токен вашего бота
telegram.setchat("chat_number")   --номер чата, куда бот будет писать сообщения
telegram.receive(true)   --обрабатывать входящие сообщения. По умолчанию выключен. [, period] Period - частота приема входящих сообщений в мс, не менее 1000. По умолчанию 1000мс.
telegram.send("SLS  загружен "..net.localIP()) --отправит сообщение с локальным адресом SLS в вашей сети в телеграм


telegram.send("Главное меню", "chat_number","parse_mode=MarkdownV2&reply_markup={\"keyboard\":[[\"Состояние_мастер_кнопки\"],[\"Включить_мастер_кнопку\",\"Выключить_мастер_кнопку\"],[\"Открыть_краны_отопления\",\"Закрыть_краны_отопления\"],[\"Открыть_воду\",\"Закрыть_воду\"],[\"Состояние_датчиков_протечки\"],[\"Температура_аварийных_датчиков\"]],\"resize_keyboard\":true,\"one_time_keyboard\":false}")

--telegram.send("Главное меню", "chat_number", "parse_mode=MarkdownV2&reply_markup={\"remove_keyboard\":true}") -- remove reply keyboard

--telegram.send("Главное меню", "CHAT_ID", "parse_mode=MarkdownV2&reply_markup={\"remove_keyboard\":true}") -- remove reply keyboard