require "ikku"
require "ruboty"

module Ruboty
  module Handlers
    class Kokodeikku < Base
      PREFIX = "ここで一句 "

      on(
        //,
        all: true,
        description: "ここで一句",
        name: "kokodeikku",
      )

      def kokodeikku(message)
        if message.from != robot.name && !message.body.start_with?(PREFIX) && (song = reviewer.find(message.body))
          message.reply("#{PREFIX}#{song.phrases.map(&:join).join(' ')}")
        end
      end

      private

      def reviewer
        @reviewer ||= Ikku::Reviewer.new
      end
    end
  end
end
