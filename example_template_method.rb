class Report
  def initialize
    @title = 'Monthly Report'
    @text = ['Things are going' , ' really, really well.']
  end

  def output_report
    output_start
    output_head
    output_body_start
    output_body
    output_body_end
    output_end 
  end

  def output_body
    @text.each do |line|
      output_line(line)
    end
  end

  def output_start
  end

  def output_head
    output_line(@title)
  end

  def output_body_start
  end

  def output_line(line)
    raise 'Called abstract method: output_line'
  end

  def output_body_end
  end

  def output_end
  end
end

# HTML REPORT CLASS, nested

class HTMLReport < Report
  def output_start
    puts('<html>')
  end

  def output_head
    puts(' <head>')
    puts("   <title>#(@title)</title>")
    puts('  </head>')
  end

  def output_body_start
    puts('<body>')
  end

  def output_line(line)
    puts("  <p>#(line)</p>")
  end

  def output_body_end
    puts('</body>')
  end
  
  def output_end
    puts('</html>')
  end

# PLAIN TEXT REPORT CLASS, nested

class PlainTextReport < Report
  def output_start
  end

  def output_head
    puts("**** #{@title} ****")
    puts
  end

  def output_body_start
  end

  def output_line(line)
    puts(line)
  end

  def output_body_end
  end
  
  def output_end
  end

  # report = HTMLReport.new
  # report.output_report
  # HTML report

  # report = PlainTextReport.new
  # report.output_report
  # PlainText report


  # Other things of note in this chapter are:
  # 1. Hook methods used in template pattern
  # 2. Duck typing, opposite static typing
  # 3. ALWAYS UNIT TEST