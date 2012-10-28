class TextDisplay
  
   def initialize(boxOptions, array, options, labelArray = nil, labelOptions = nil)
      @document = boxOptions[:document]
      @label_enabled = labelArray && labelOptions
      
      #text
      @text_width = options[:width] || 20
      @text_height = options[:height] || 15 
      @text_align = options[:align] || :center
      @text_valign = options[:valign] || :center      
      @text_color = options[:color] || '000000'
      @text_background_color = options[:background_color] if options[:background_color]
      @text_borders = options[:borders] || []
      @text_positions = @label_enabled ? [labelOptions[:width], 0] : [0, 0]
      @text = array
      @options = options
      
      # Label 
      if @label_enabled
        @label_position = boxOptions[:label_position] || :left # position will be :top, :bottom, :left, :right
        @label_color = labelOptions[:color] || '000000'
        @label_background_color = labelOptions[:background_color] if labelOptions[:background_color]
        @label_borders = labelOptions[:borders] || []
        @label_align =  labelOptions[:align] || :center
        @label_valign =  labelOptions[:valign] || :center
        @label_height = labelOptions[:height] || @text_height
        @label_width = labelOptions[:width] || @text_width
        @label_positions = labelOptions[:at] || [0, @label_height]
        @label = labelArray
      end
    
     # box     
     @box_x = boxOptions[:at] ? boxOptions[:at].first : 0
     @box_y = boxOptions[:at] ? boxOptions[:at].last : @document.cursor
     
     if @label_enabled
       @box_width = @text_width + @label_width
     else
       @box_width = @text_width
     end
     
     @box_height = @text_height
     
   end
  
   def render
   
   if @label_enabled
     case @label_position
     when :left
       @box_width = @text_width + @label_width
       @box_height = @text_height
       @label_positions = [0, @box_height]
       @text_positions = [@label_width, @box_height]
       
     when :right
       @box_width = @text_width + @label_width
       @box_height = @text_height
       @label_positions = [@text_width, @box_height]
       @text_positions = [0, @box_height]
       
     when :top
       @box_width = @text_width
       @box_height = @text_height + @label_height
       @label_positions = [0, @box_height]
       @text_positions = [0, @box_height - @label_height]
       
     when :bottom
       @box_width = @text_width
       @box_height = @text_height + @label_height
       @label_positions = [0, @box_height - @text_height - 1]
       @text_positions = [0, @box_height]
     end
   else
      @box_width = @text_width
      @box_height = @text_height
      @text_positions = [0, @box_height]
   end
     
      @document.bounding_box [@box_x, @box_y], :width => @box_width, :height => @box_height do
        FormattedTextDisplay.new(@text,
                                 :document => @document,
                                 :background_color => @text_background_color,
                                 :borders => @text_borders,
                                 :at => @text_positions,
                                 :height => @text_height, 
                                 :width => @text_width,
                                 :align => @text_align,
                                 :valign => @text_valign)
                                
         # label
         FormattedTextDisplay.new(@label,
                                   :document => @document,      
                                   :background_color => @label_background_color,
                                   :borders => @label_borders,
                                   :at => @label_positions,
                                   :height => @label_height, 
                                   :width => @label_width,
                                   :align => @label_align,
                                   :valign => @label_valign) if @label_enabled

      end
   end
end

class FormattedTextDisplay #< Prawn::Text::Formatted::Box
      attr_reader :width, :height

  def initialize(array, options)
      @document = options[:document]
      @background_color = options[:background_color] if options[:background_color]
      @borders = options[:borders] || []

      @width = options[:width]
      @height = options[:height]
      
      @x = options[:at].first || 0
      @y = options[:at].last || 0

      frame = Frame.new(:document => @document, :parent => self, :background_color => @background_color, :borders => @borders)
      #super(array.each {|row| row.merge!(:callback => frame) }, options.merge!(:document => @document) )
      frame.render    
      @document.formatted_text_box  array, options
                            
      
  end
  
  def left
    @x
  end
  
  def right
    left + @width
  end
  
  def bottom
    @y - @height
  end
  
  def top
    @y
  end
  
  def top_left
    [left, top]
  end
  
  def width
    @width
  end
  
  def height
    @height
  end
  
end


class Frame
   
   def initialize(options = {})
      @document = options[:document]
      @background_color = options[:background_color]
      @color = options[:color] || '000000'
      @borders = options[:borders] || [:top, :left, :bottom, :right]
      @parent = options[:parent]
   end
   
   def render
      original_color = @document.fill_color
      unless @background_color == nil
        @document.fill_color = @background_color
        @document.fill_rectangle(@parent.top_left, @parent.width, @parent.height) 
      end
      
      @document.line_width = 0.5  
      @document.stroke_horizontal_line(@parent.left, @parent.right, :at => @parent.bottom) if @borders.include?(:bottom)
      @document.stroke_horizontal_line(@parent.left, @parent.right, :at => @parent.top) if @borders.include?(:top)    
      @document.stroke_vertical_line(@parent.top, @parent.bottom, :at => @parent.left) if @borders.include?(:left)
      @document.stroke_vertical_line(@parent.top, @parent.bottom, :at => @parent.right) if @borders.include?(:right)    
    
      @document.fill_color = original_color
    
   end
end


