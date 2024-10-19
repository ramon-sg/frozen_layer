require "cr-color-logging"

level = FrozenLayer.config.dev? ? Log::Severity::Debug : Log::Severity::Info

Log.setup(level, Log::IOBackend.new(formatter: Log::ShortColorFormat))

Log::ShortColorFormat.with_colored_severity(Log::Severity::Error, :red)
Log::ShortColorFormat.with_colored_severity(Log::Severity::Info, :blue)
Log::ShortColorFormat.with_colored_severity(Log::Severity::Warn, :yellow)
