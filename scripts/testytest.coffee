Conversation = require 'hubot-conversation'

module.exports = (robot) ->

  switchBoard = new Conversation robot

  robot.respond /screw you/i, (res) ->
    res.reply 'Ouch!'

  robot.respond /(hi|hello|how are you)/i, (msg) ->

    dialog = switchBoard.startDialog msg, 600000
    dialog.timeout = (msg) ->
      robot.logger.info "Onboarding dialogue with #{msg.envelope.user.name} timed out."

    msg.reply "Hi #{msg.envelope.user.name}! I'm Annie, friendly bot. Quick question: Do you want me to sing a song?"

    dialog.addChoice /(yes|yeah|yup|yep|y)/i, (msg2) ->
       msg2.reply "TWINKLE TWINKLE LITTLE STAAAR!!!"

