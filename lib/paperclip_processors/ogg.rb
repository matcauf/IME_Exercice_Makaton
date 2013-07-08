module Paperclip
  # Converts ogg audio for Firefox
  class Ogg < Processor

    attr_accessor :whiny
    # Creates an Ogg from MP3
    def make
      src = @file
      dst = Tempfile.new([@basename, '.ogg'])
      command = <<-end_command
-
"#{ File.expand_path(src.path) }"
| /usr/bin/oggenc - -o
"#{ File.expand_path(dst.path) }"
end_command

      begin
        success = Paperclip.run("/usr/bin/mpg321 -q -w", command.gsub(/\s+/, " "))
        Rails.logger.info "Converting #{src.path} to #{dst.path} in the Ogg processor."
      rescue Cocaine::ExitStatusError => e
        raise PaperclipError, "There was an error converting #{@basename}" if @whiny
      end
      dst
    end
  end
end