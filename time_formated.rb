class TimeFormated

  attr_reader :status

  FORMATS = {'year' => '%Y-', 'month' => '%m-', 'day' => '%d ',
            'hour' => '%H:', 'minute' => '%M:', 'second' => '%S '
            }.freeze

  def initialize(params)
    @params = params
  end

  def time_format
    return body_status_404 if @params['format'].nil?

    check_parameters

    return body_status_400 unless @unknow.empty?

    body_status_200
  end

  private

  def check_parameters
    @output_result = ''
    @unknow = ''
    @params['format'].split(',').each do |param|
      if FORMATS[param]
        @output_result += FORMATS[param]
      else
        @unknow += "#{param} | "
      end
    end
  end

  def body_status_404
    @status = 404
    "Format Not Found!"
  end


  def body_status_400
    @status = 400
    "Unknown time formats:  #{@unknow}"
  end

  def body_status_200
    @status = 200
    Time.now.strftime(@output_result)
  end

end
