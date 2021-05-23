# frozen_string_literal: true

require 'appium_lib'

module Appium
  module Core
    module Wait
      class TimeoutError < StandardError
      end
      class << self
        def until(timeout: DEFAULT_TIMEOUT, interval: DEFAULT_INTERVAL, message: nil, ignored: nil, object: nil)
          ignored = Array(ignored || ::Exception)

          last_error = nil
          timer = Wait::Timer.new(timeout)

          until timer.timeout?
            begin
              return yield(object)
            rescue ::Errno::ECONNREFUSED => e
              raise e
            rescue *ignored => e
              # swallowed
            end
            sleep interval
          end

          # TODO: remover screen
          raise 'Erro Timeout astronauta' if AutenticadorScreen.new.txt_error_msg_on_screen?
          raise 'Erro Timeout Carro' if AutenticadorScreen.new.txt_erro_carro_on_screen?
          raise 'Erro Timeout Ops' if AutenticadorScreen.new.txt_ops_problema_on_screen?

          msg = message_for timeout, message
          msg += " (#{last_error.message})" if last_error

          raise TimeoutError, msg
        end
      end
    end
  end
end
