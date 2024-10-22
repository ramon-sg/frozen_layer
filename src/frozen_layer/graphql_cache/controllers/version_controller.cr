module FrozenLayer
  module GraphqlCache
    class VersionController < FrozenLayer::BaseController
      def index(ctx : Context)
        ctx.put_status(200).json({version: VERSION})
      end
    end
  end
end
