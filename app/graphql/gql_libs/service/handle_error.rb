module GqlLibs
  module Service
    class HandleError
      def self.call(e)
        logger = ActiveSupport::Logger.new(STDOUT)
        logger.error(e.message)
        logger.error(e.backtrace.join("\n"))
        logger = nil

        raise SecurityError, { json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500 }
      end
    end
  end
end
