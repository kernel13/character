
require 'TextDisplay'

class Sheet < Prawn::Document
  include ActionView::Helpers::TranslationHelper
  
  # GENEARL CONSTANT
  FONT_SIZE = 10
  LABEL_FONT_SIZE = 7
  
  #HEADDER CONSTANT
  HEADER_LABEL_FONT_SIZE = 9
  HEADER_LINE_WIDTH = 0.5
  HEADER_BOXING_HEIGHT = 16
  
  WEAPON_LABEL_HEIGHT = 12
   
  def initialize(character, view)
    super(:margin => [20, 5, 5, 5 ], :page_size => "A4")
    @character = character
    @view = view
    
    header
    caracteristic
    hit_points
    speed
    armor_class
    initiative
    skills
    saving_throw
    baseAttackSpellResist
    grapple
    weapons
    
    start_new_page
    
    #Campaign
    
    # TextDisplay.new({:document => self, :at => [10, bounds.top], :label_position => :bottom},
    #                       [{:text => @character.campaign, :size => FONT_SIZE}], 
    #                       {:background_color => "ffffff", :width => 200, :height => 15, :borders => [:bottom]},
    #                       [{:text => t('character_sheet.campaign'), :size => LABEL_FONT_SIZE}],
    #                       {:height => 10, :align => :left}).render
                      
    #Experience point
    TextDisplay.new({:document => self, :at => [10, bounds.top], :label_position => :bottom},
                      [{:text => @character.experience.to_s, :size => FONT_SIZE}], 
                      {:background_color => "ffffff", :width => 260, :height => 15, :borders => [:top, :bottom, :left, :right]},
                      [{:text => t('character_sheet.experience'), :size => LABEL_FONT_SIZE}],
                      {:height => 10, :align => :left}).render
    
    protection
    possessions
    
    #Money
     TextDisplay.new({:document => self, :at => [@x_position, @y_position - 410], :label_position => :top},
                        [{:text => @character.money.to_s, :size => FONT_SIZE}], 
                        {:background_color => "ffffff", :width => 260, :align => :left, :height => 100, :borders => [:top, :bottom, :left, :right]},
                        [{:text => t('character_sheet.money'), :color => "ffffff", :size => LABEL_FONT_SIZE}],
                        {:background_color => "000000", :height => 15, :align => :center}).render
                        
    #Feats
     x_position = 280
     bounding_box([x_position, bounds.top], :width => 80, :height => 200) do 
       y_position = 200
    
      @character.feats.each do |feat|
         y_position -= 18
         TextDisplay.new({:document => self, :at => [0, y_position]},
                         [{:text => feat.name.to_s, :size => FONT_SIZE}], 
                         {:width => 100, :height => 15, :borders => [:bottom]}).render
      end
      
        y_position = 200
       TextDisplay.new({:document => self, :at => [0, y_position]},
                       [{:text => t('character_sheet.feats'), :color => "ffffff", :size => LABEL_FONT_SIZE}], 
                       {:background_color => "000000", :width => 100, :height => 15, :borders => [:top, :bottom, :left, :right]}).render
    end
    
    #Special abilities
     x_position = 280
     bounding_box([x_position, bounds.top - 250], :width => 80, :height => 200) do 
       y_position = 200
    
      @character.special_abilities.each do |special_ability|
         y_position -= 18
         TextDisplay.new({:document => self, :at => [0, y_position]},
                         [{:text => special_ability.name.to_s, :size => FONT_SIZE}], 
                         {:width => 100, :height => 15, :borders => [:bottom]}).render
      end
      
        y_position = 200
       TextDisplay.new({:document => self, :at => [0, y_position]},
                       [{:text => t('character_sheet.special_abilities'), :color => "ffffff", :size => LABEL_FONT_SIZE}], 
                       {:background_color => "000000", :width => 100, :height => 15, :borders => [:top, :bottom, :left, :right]}).render
    end
    
    #Language
     x_position = 280
     bounding_box([x_position, bounds.top - 620], :width => 80, :height => 200) do 
       y_position = 200
    
      @character.languages.each do |language|
         y_position -= 18
         TextDisplay.new({:document => self, :at => [0, y_position]},
                         [{:text => language.name.to_s, :size => FONT_SIZE}], 
                         {:align => :left, :width => 100, :height => 15, :borders => [:bottom]}).render
      end
      
        y_position = 200
       TextDisplay.new({:document => self, :at => [0, y_position]},
                       [{:text => t('character_sheet.languages'), :color => "ffffff", :size => LABEL_FONT_SIZE}], 
                       {:background_color => "000000", :width => 100, :height => 15, :borders => [:top, :bottom, :left, :right]}).render
    end
    
    #Turn undead
     x_position = 390
     y_position = 200
     
     bounding_box([x_position, bounds.top], :width => 190, :height => 200) do 
        TextDisplay.new({:document => self, :at => [0, 200]},
                        [{:text => t('character_sheet.turn_undead.label').upcase, :color => "ffffff", :size => LABEL_FONT_SIZE}], 
                        {:background_color => "000000", :width => 190, :height => 15, :borders => [:top, :bottom, :left, :right]}).render
                        
        
        x_position = 0                          
        TextDisplay.new({:document => self, :at => [x_position, 185], :label_position => :top},
                        [{:text => @character.turn_undead_times_per_day.to_s, :size => FONT_SIZE}], 
                        {:width => 60, :height => 15, :borders => [:top, :bottom, :left, :right]},
                        [{:text => t('character_sheet.turn_undead.times_per_day'), :color => "000000", :size => LABEL_FONT_SIZE}],
                        {:height => 15, :align => :center}).render
          
        
        x_position += 65
        TextDisplay.new({:document => self, :at => [x_position, 185], :label_position => :top},
                        [{:text => @character.turn_undead_check.to_s, :size => FONT_SIZE}], 
                        {:width => 60, :height => 15, :borders => [:top, :bottom, :left, :right]},
                        [{:text => t('character_sheet.turn_undead.turning_check'), :color => "000000", :size => LABEL_FONT_SIZE}],
                        {:height => 15, :align => :center}).render
                        
       x_position += 65
        TextDisplay.new({:document => self, :at => [x_position, 185], :label_position => :top},
                        [{:text => @character.turn_undead_damage.to_s, :size => FONT_SIZE}], 
                        {:width => 60, :height => 15, :borders => [:top, :bottom, :left, :right]},
                        [{:text => t('character_sheet.turn_undead.turning_damage'), :color => "000000", :size => LABEL_FONT_SIZE}],
                        {:height => 15, :align => :center}).render
               
     end
     
     #psionic
     x_position = 390
     y_position = 200
     bounding_box([x_position, bounds.top - 60], :width => 190, :height => 200) do 
         TextDisplay.new({:document => self, :at => [0, 200]},
                         [{:text => t('character_sheet.psionics.label').upcase, :color => "ffffff", :size => LABEL_FONT_SIZE}], 
                         {:background_color => "000000", :width => 190, :height => 15, :borders => [:top, :bottom, :left, :right]}).render
              
         TextDisplay.new({:document => self, :at => [0, 180]},
                         [{:text => t('character_sheet.psionics.title'), :color => "000000", :size => LABEL_FONT_SIZE}], 
                         {:background_color => "ffffff", :width => 40, :height => 15}).render
       
         TextDisplay.new({:document => self, :at => [45, 180], :label_position => :bottom},
                         [{:text => @character.psi_powers_known.to_s, :size => FONT_SIZE}], 
                         {:width => 60, :height => 15, :borders => [:bottom]},
                         [{:text => t('character_sheet.psionics.powers_known'), :color => "000000", :size => LABEL_FONT_SIZE}],
                         {:height => 15, :align => :center}).render
              
         TextDisplay.new({:document => self, :at => [110, 180], :label_position => :bottom},
                          [{:text => @character.psi_max_level.to_s, :size => FONT_SIZE}], 
                          {:width => 60, :height => 15, :borders => [:bottom]},
                          [{:text => t('character_sheet.psionics.max_power_level'), :color => "000000", :size => LABEL_FONT_SIZE}],
                          {:height => 15, :align => :center}).render
                   
         TextDisplay.new({:document => self, :at => [0, 140], :label_position => :left},
                          [{:text => @character.psi_primary_dicipline.to_s, :size => FONT_SIZE}], 
                          {:width => 120, :height => 15, :borders => [:top, :bottom, :left, :right]},
                          [{:text => t('character_sheet.psionics.primary_discipline'), :color => "000000", :size => LABEL_FONT_SIZE}],
                          {:width => 60, :height => 15, :align => :left}).render  
                          
        
         TextDisplay.new({:document => self, :at => [0, 120], :label_position => :top},
                          [{:text => @character.psi_power_points_per_day.to_s, :size => FONT_SIZE}], 
                          {:width => 190, :height => 15, :borders => [:bottom]},
                          [{:text => t('character_sheet.psionics.power_points_per_day'), :color => "000000", :size => LABEL_FONT_SIZE}],
                          {:width => 100, :height => 15, :align => :left}).render
                         
     end
     
     #Magick
     x_position = 390
     bounding_box([x_position, bounds.top - 180], :width => 190, :height => 200) do 
        TextDisplay.new({:document => self, :at => [0, 200]},
                        [{:text => t('character_sheet.magic.label').upcase, :color => "ffffff", :size => LABEL_FONT_SIZE}], 
                        {:background_color => "000000", :width => 190, :height => 15, :borders => [:top, :bottom, :left, :right]}).render
       
        TextDisplay.new({:document => self, :at => [0, 180]},
                        [{:text => t('character_sheet.magic.title_cleric').upcase, :color => "000000", :size => LABEL_FONT_SIZE}], 
                        {:background_color => "ffffff", :width => 190, :height => 15, :align => :left}).render

        TextDisplay.new({:document => self, :at => [0, 170], :label_position => :bottom},
                          [{:text => @character.divine_domain_name1.to_s, :size => FONT_SIZE}], 
                          {:width => 90, :height => 15, :borders => [:bottom]},
                          [{:text => t('character_sheet.magic.domain_name'), :color => "000000", :size => LABEL_FONT_SIZE}],
                          {:width => 100, :height => 15, :align => :left}).render
                          
        TextDisplay.new({:document => self, :at => [100, 170], :label_position => :bottom},
                          [{:text => @character.divine_granted_power1.to_s, :size => FONT_SIZE}], 
                          {:width => 90, :height => 15, :borders => [:bottom]},
                          [{:text => t('character_sheet.magic.granted_power'), :color => "000000", :size => LABEL_FONT_SIZE}],
                          {:width => 100, :height => 15, :align => :left}).render
       
              
        TextDisplay.new({:document => self, :at => [0, 140], :label_position => :bottom},
                          [{:text => @character.divine_domain_name2.to_s, :size => FONT_SIZE}], 
                          {:width => 90, :height => 15, :borders => [:bottom]},
                          [{:text => t('character_sheet.magic.domain_name'), :color => "000000", :size => LABEL_FONT_SIZE}],
                          {:width => 100, :height => 15, :align => :left}).render

        TextDisplay.new({:document => self, :at => [100, 140], :label_position => :bottom},
                          [{:text => @character.divine_granted_power2.to_s, :size => FONT_SIZE}], 
                          {:width => 90, :height => 15, :borders => [:bottom]},
                          [{:text => t('character_sheet.magic.granted_power'), :color => "000000", :size => LABEL_FONT_SIZE}],
                          {:width => 100, :height => 15, :align => :left}).render
                          
                                                
        TextDisplay.new({:document => self, :at => [0, 110]},
                        [{:text => t('character_sheet.magic.title_wizard').upcase, :color => "000000", :size => LABEL_FONT_SIZE}], 
                        {:background_color => "ffffff",:align => :left, :width => 190, :height => 15}).render
    

         TextDisplay.new({:document => self, :at => [0, 90], :label_position => :bottom},
                            [{:text => @character.arcane_speciality_school.to_s, :size => FONT_SIZE}], 
                            {:width => 60, :height => 15, :borders => [:bottom]},
                            [{:text => t('character_sheet.magic.specialty_school'), :color => "000000", :size => LABEL_FONT_SIZE}],
                            {:width => 60, :height => 15, :align => :left}).render

        TextDisplay.new({:document => self, :at => [65, 90], :label_position => :bottom},
                           [{:text => @character.arcane_prohibited_school1.to_s, :size => FONT_SIZE}], 
                           {:width => 60, :height => 15, :borders => [:bottom]},
                           [{:text => t('character_sheet.magic.prohibited_school'), :color => "000000", :size => LABEL_FONT_SIZE}],
                           {:width => 60, :height => 15, :align => :left}).render
                           
         TextDisplay.new({:document => self, :at => [130, 90], :label_position => :bottom},
                            [{:text => @character.arcane_prohibited_school2.to_s, :size => FONT_SIZE}], 
                            {:width => 60, :height => 15, :borders => [:bottom]},
                            [{:text => t('character_sheet.magic.prohibited_school'), :color => "000000", :size => LABEL_FONT_SIZE}],
                            {:width => 60, :height => 15, :align => :left}).render

        TextDisplay.new({:document => self, :at => [0, 50], :label_position => :left},
                           [{:text => @character.arcane_spell_failure.to_s, :size => FONT_SIZE}], 
                           {:width => 130, :height => 15, :borders => [:top, :bottom, :left, :right]},
                           [{:text => t('character_sheet.magic.arcane_spell_failure').capitalize, :color => "000000", :size => LABEL_FONT_SIZE}],
                           {:width => 60, :height => 15, :align => :left}).render


        # spells
        TextDisplay.new({:document => self, :at => [0, 20]},
                      [{:text => t('character_sheet.spells.spells_known'), :color => "000000", :size => LABEL_FONT_SIZE}], 
                      {:background_color => "ffffff", :width => 30, :height => 15}).render
                      
        TextDisplay.new({:document => self, :at => [40, 20]},
                      [{:text => t('character_sheet.spells.spell_save'), :color => "000000", :size => LABEL_FONT_SIZE}], 
                      {:background_color => "ffffff", :width => 30, :height => 15}).render
    
        TextDisplay.new({:document => self, :at => [80, 20]},
                      [{:text => t('character_sheet.spells.level'), :color => "000000", :size => LABEL_FONT_SIZE}], 
                      {:background_color => "ffffff", :width => 30, :height => 15}).render


        TextDisplay.new({:document => self, :at => [120, 20]},
                      [{:text => t('character_sheet.spells.spells_per_day'), :color => "000000", :size => LABEL_FONT_SIZE}], 
                      {:background_color => "ffffff", :width => 30, :height => 15}).render
                      
        TextDisplay.new({:document => self, :at => [160, 20]},
                      [{:text => t('character_sheet.spells.bonus_spell'), :color => "000000", :size => LABEL_FONT_SIZE}], 
                      {:background_color => "ffffff", :width => 30, :height => 15}).render
                      
       
       y_position = 20
        @character.spells.each do |spell|
             y_position -= 20
           
              TextDisplay.new({:document => self, :at => [0, y_position]},
                             [{:text => spell.spells_known.to_s, :color => "000000", :size => LABEL_FONT_SIZE}], 
                             {:background_color => "ffffff", :width => 30, :height => 15, :borders => [:top, :bottom, :left, :right]}).render

               TextDisplay.new({:document => self, :at => [40, y_position]},
                             [{:text => spell.spell_save.to_s, :color => "000000", :size => LABEL_FONT_SIZE}], 
                             {:background_color => "ffffff", :width => 30, :height => 15, :borders => [:top, :bottom, :left, :right]}).render

               TextDisplay.new({:document => self, :at => [80, y_position]},
                             [{:text => spell.level.to_s, :color => "000000", :size => LABEL_FONT_SIZE}], 
                             {:background_color => "ffffff", :width => 30, :height => 15, :borders => [:top, :bottom, :left, :right]}).render

               TextDisplay.new({:document => self, :at => [120, y_position]},
                             [{:text => spell.spells_per_day.to_s, :color => "000000", :size => LABEL_FONT_SIZE}], 
                             {:background_color => "ffffff", :width => 30, :height => 15, :borders => [:top, :bottom, :left, :right]}).render

               TextDisplay.new({:document => self, :at => [160, y_position]},
                             [{:text => spell.bonus_spells.to_s, :color => "000000", :size => LABEL_FONT_SIZE}], 
                             {:background_color => "ffffff", :width => 30, :height => 15, :borders => [:top, :bottom, :left, :right]}).render

        end
        
     end  
     
    TextDisplay.new({:document => self, :at => [390, bounds.top - 580], :label_position => :top},
                     [{:text => @character.notes.to_s, :size => FONT_SIZE}], 
                     {:background_color => "ffffff", :width => 190, :align => :left, :height => 170, :borders => [:top, :bottom, :left, :right]},
                     [{:text => t('character_sheet.notes'), :color => "ffffff", :size => LABEL_FONT_SIZE}],
                     {:background_color => "000000", :height => 15, :align => :center}).render
   
  end
  
  private
  
  def header
    @x_position = 10
    @y_position = cursor - 10
    
    # Title
    image_path = Rails.root.join('app', 'assets', 'images', 'title.png')
    image image_path, :at => [@x_position + 450, @y_position - 15], :width => 110
    
    # Name
    bounding_box([@x_position, @y_position - 5], :width => 170, :height => HEADER_BOXING_HEIGHT) do  
       display_column(t('character_sheet.name'), @character.name, 170)   
    end
    
    #Class and level
    @x_position += 175
    bounding_box([@x_position, @y_position - 5], :width => 270, :height => HEADER_BOXING_HEIGHT) do
        display_column(t('character_sheet.classes'), @character.classes, 270)     
    end   
    
    #race
    @x_position = 10
    @y_position = cursor - 10
    bounding_box([@x_position, @y_position - 5], :width => 130, :height => HEADER_BOXING_HEIGHT) do  
        display_column(t('character_sheet.race'), @character.race, 130)  
    end
    
    # Alignment
    @x_position += 135
    bounding_box([@x_position, @y_position - 5], :width => 50, :height => HEADER_BOXING_HEIGHT) do  
        display_column(t('character_sheet.alignment'), @character.alignment, 50)
                
    end    
       
    # Gender
    @x_position += 55
    bounding_box([@x_position, @y_position - 5], :width => 50, :height => HEADER_BOXING_HEIGHT) do 
        display_column(t('character_sheet.gender'), @character.gender, 50)   
    end
    
   # Height
    @x_position += 60
    bounding_box([@x_position, @y_position - 5], :width => 50, :height => HEADER_BOXING_HEIGHT) do 
        display_column(t('character_sheet.height'), @character.height, 50)
    end
    
    # Master
    @x_position += 55
    bounding_box([@x_position, @y_position - 5], :width => 135, :height => HEADER_BOXING_HEIGHT) do 
       display_column(t('character_sheet.master'), @character.master, 135)
    end
    
    # Age
    @x_position = 10
    @y_position = cursor - 10
    bounding_box([@x_position, @y_position - 5], :width => 70, :height => HEADER_BOXING_HEIGHT) do 
       display_column(t('character_sheet.age'), @character.age, 70)
    end
    
    # Eyes
    @x_position += 75
    bounding_box([@x_position, @y_position - 5], :width => 70, :height => HEADER_BOXING_HEIGHT) do 
        display_column(t('character_sheet.eyes'), @character.eyes, 70)
    end
    
    # Eyes
    @x_position += 75
    bounding_box([@x_position, @y_position - 5], :width => 70, :height => HEADER_BOXING_HEIGHT) do 
        display_column(t('character_sheet.hair'), @character.hair, 70)
       
    end
    
    # Skin
    @x_position += 75
    bounding_box([@x_position, @y_position - 5], :width => 105, :height => HEADER_BOXING_HEIGHT) do 
        display_column(t('character_sheet.skin'), @character.skin, 105)
    end
    
    # Deity
    @x_position += 110
    bounding_box([@x_position, @y_position - 5], :width => 110, :height => HEADER_BOXING_HEIGHT) do 
        display_column(t('character_sheet.deity'), @character.deity, 110)    
    end
  end
  
  def caracteristic
    
     @x_position = 10
     @y_position = cursor - 10
     y_position = 190
     
     data = [[@view.strip_tags(t('character_sheet.ability_name').gsub("<br />", "\n")), @view.strip_tags(t('character_sheet.ability_score').gsub("<br />", "\n")), @view.strip_tags(t('character_sheet.ability_modifier').gsub("<br />", "\n")), @view.strip_tags(t('character_sheet.temporary_score').gsub("<br />", "\n")), @view.strip_tags(t('character_sheet.temporary_modifier').gsub("<br />", "\n"))],
             [t('character_sheet.strength'), @character.strength,  @character.characteristic_bonus(@character.strength), @character.temporarystrength, @character.characteristic_bonus(@character.temporarystrength)],
             [t('character_sheet.dexterity'), @character.dexterity,  @character.characteristic_bonus(@character.dexterity), @character.temporarydexterity, @character.characteristic_bonus(@character.temporarydexterity)],
             [t('character_sheet.constitution'), @character.constitution,  @character.characteristic_bonus(@character.constitution), @character.temporaryconstitution, @character.characteristic_bonus(@character.temporaryconstitution)],
             [t('character_sheet.intelligence'), @character.intelligence,  @character.characteristic_bonus(@character.intelligence), @character.temporaryintelligence, @character.characteristic_bonus(@character.temporaryintelligence)],
             [t('character_sheet.wisdom'), @character.wisdom,  @character.characteristic_bonus(@character.wisdom), @character.temporarywisdom, @character.characteristic_bonus(@character.temporarywisdom)],
             [t('character_sheet.charisma'), @character.charisma,  @character.characteristic_bonus(@character.charisma), @character.temporarycharisma, @character.characteristic_bonus(@character.temporarycharisma)]]
      
      
     bounding_box([@x_position, @y_position + 10], :width => 170, :height => 200) do
      
         data.each_with_index do |row, index|
               x_position = 0

              row.each_with_index do |cell, cell_index|
                 if index == 0                    
                   TextDisplay.new({:document => self, :at => [x_position, y_position]},
                                    [{:text => cell.to_s, :color => '000000', :size => FONT_SIZE}], 
                                    {:width => 30, :height => 20}).render                      
                else
                   if cell_index == 0
                      l1, l2 = cell.to_s[0..2].upcase + "\n", cell.to_s
                      TextDisplay.new({:document => self, :at => [x_position, y_position]},
                                      [{:text => l1, :color => 'ffffff', :size => FONT_SIZE, :styles => [:bold] },
                                       {:text => l2, :color => 'ffffff', :size => 5, :styles => [:bold]}],
                                       {:width => 30, :height => 20, :background_color => "000000", :borders => [:left, :top, :right, :bottom]}).render
                   else
                     TextDisplay.new({:document => self, :at => [x_position, y_position]},
                                     [{:text => cell.to_s, :color => '000000', :size => FONT_SIZE}], 
                                     {:width => 30, :height => 20, :borders => [:left, :top, :right, :bottom]}).render
                     
                    end
                end
                
                x_position += 33                         
              end #end each cell
               y_position -= 22      
          end  #end each row
      
    end
     # bounding_box([@x_position, @y_position], :width => 170, :height => 190) do
     #      table(data, :cell_style => {:font_style => :bold, :overflow => :shrink_to_fit, :border_width => 0.5, :width => 30, :height => 20, :align => :center, :size => FONT_SIZE })  do
     #         columns(0).background_color = "000000"
     #         columns(0).text_color = "ffffff"
     #         columns(0).size = FONT_SIZE  
     #         columns(0).width = 45
     #         rows(0).borders = []
     #         rows(0).background_color = "ffffff"
     #         rows(0).text_color = "000000"
     #         rows(0).size = LABEL_FONT_SIZE
     #       end
    #end
  end  
  
  def hit_points
      height = 23
      width = 35
      x_position = 0
      y_position = 50
      
      (hp, hitpoints) = t('character_sheet.hitpoints').split('<br />')
      
      
      bounding_box([@x_position + 170, @y_position], :width => 230, :height => 50) do
       
        label(@view.strip_tags(hp), "\n" + @view.strip_tags(hitpoints), width, height, [x_position, y_position - 20], 9)   
        
        x_position += 40
        bounding_box([x_position, y_position - 6], :width => width, :height => height) do
           text t('character_sheet.totalhp'), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
        end
        bounding_box([x_position , y_position - 20], :width => width, :height => height) do
           text @character.totalhp.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
           stroke_bounds   
        end
        
         x_position += 40
        bounding_box([x_position, y_position - 6], :width => 85, :height => height) do
           text t('character_sheet.wounds'), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
        end
        bounding_box([x_position, y_position - 20], :width => 85, :height => height) do
           text @character.wounds.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
           stroke_bounds
        end
          
        x_position += 95 
        bounding_box([x_position, y_position - 6], :width => 85, :height => height) do
           text t('character_sheet.nonelethal'), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
        end
        bounding_box([x_position, y_position - 20], :width => 85, :height => height) do
          text @character.nonelethal.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
          stroke_bounds
        end
      
    end  
        
  end  
  
  def speed
     bounding_box([@x_position + 440, @y_position - 20], :width => 60, :height => 20) do
        text @character.speed.to_s, :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
        stroke_bounds
    end
    bounding_box([@x_position + 440, @y_position - 7], :width => 60, :height => 20) do
        text @view.strip_tags(t('character_sheet.speed')), :size => FONT_SIZE, :align => :center, :valign => :center
    end
  end
  
  def armor_class
     height = 23
     width = 42
     y_position = 40
     x_position = 0
     
     (ac, armorclass) = t('character_sheet.armorclass').split('<br />')
      
      bounding_box([@x_position + 170, @y_position - 30], :width => 300, :height => 50) do
      
        label(@view.strip_tags(ac), "\n" + @view.strip_tags(armorclass), width, height, [x_position, y_position - 10], 8)
      
         # Total
         x_position += 45
      
          bounding_box([x_position, y_position - 10], :width => 30, :height => height) do
             text @character.total_armorclass.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
             stroke_bounds
          end
          bounding_box([x_position, y_position - 26], :width => 30, :height => height) do
             text @view.strip_tags(t('character_sheet.totalac')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
          end

           x_position += 28
           bounding_box([x_position, y_position - 10], :width => 40, :height => height) do
             text " = 10 + ", :size => FONT_SIZE, :align => :center, :valign => :center
           end

           # Armour bonus
           x_position += 37
           bounding_box([x_position, y_position - 10], :width => 20, :height => height) do
               text @character.armorbonus.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
               stroke_bounds
           end
           bounding_box([x_position, y_position - 26], :width => 20, :height => height) do
               text @view.strip_tags(t('character_sheet.armorbonus')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
           end
           
           x_position += 22
           bounding_box([x_position, y_position - 10], :width => 10, :height => height) do
               text " + ", :size => FONT_SIZE, :align => :center, :valign => :center
           end
           
           # Shield
           x_position += 12
          bounding_box([x_position, y_position - 10], :width => 20, :height => height) do
              text @character.shieldbonus.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
              stroke_bounds
          end
          bounding_box([x_position, y_position - 26], :width => 20, :height => height) do
              text @view.strip_tags(t('character_sheet.shieldbonus')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
          end
          
           x_position += 22
           bounding_box([x_position, y_position - 10], :width => 10, :height => height) do
               text " + ", :size => FONT_SIZE, :align => :center, :valign => :center
           end
           
           # Dexterity bonus
           x_position += 10
           bounding_box([x_position, y_position - 10], :width => 20, :height => height) do
               text @character.dexterity_bonus.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
               stroke_bounds
           end
           bounding_box([x_position, y_position - 26], :width => 20, :height => height) do
               text @view.strip_tags(t('character_sheet.dextmodifier')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
           end
           
            x_position += 22
            bounding_box([x_position, y_position - 10], :width => 10, :height => height) do
                text " + ", :size => FONT_SIZE, :align => :center, :valign => :center
            end
            
           # size modifier 
           x_position += 10
            bounding_box([x_position, y_position - 10], :width => 20, :height => height) do
                text @character.sizemodifier.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
                stroke_bounds
            end
            bounding_box([x_position, y_position - 26], :width => 20, :height => height) do
                text @view.strip_tags(t('character_sheet.sizemodifier')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
            end
            
            x_position += 22
            bounding_box([x_position, y_position - 10], :width => 10, :height => height) do
                text " + ", :size => FONT_SIZE, :align => :center, :valign => :center
            end

             # size modifier 
             x_position += 10
             bounding_box([x_position, y_position - 10], :width => 20, :height => height) do
                text @character.naturalarmor.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
                stroke_bounds
            end
            bounding_box([x_position - 2, y_position - 26], :width => 25, :height => height) do
                text @view.strip_tags(t('character_sheet.naturalarmor')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
            end
              
              x_position += 22
              bounding_box([x_position, y_position - 10], :width => 10, :height => height) do
                  text " + ", :size => FONT_SIZE, :align => :center, :valign => :center
              end

             # deflection modifier 
             x_position += 12
             bounding_box([x_position, y_position - 10], :width => 20, :height => height) do
                text @character.deflectionmodifier.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
                stroke_bounds
            end
            bounding_box([x_position - 5, y_position - 26], :width => 30, :height => height) do
                text @view.strip_tags(t('character_sheet.deflectionmodifier')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
            end
            
            x_position += 22
            bounding_box([x_position, y_position - 10], :width => 10, :height => height) do
                text " + ", :size => FONT_SIZE, :align => :center, :valign => :center
            end

             # misc modifier 
             x_position += 10
             bounding_box([x_position, y_position - 10], :width => 20, :height => height) do
                text @character.miscmodifier.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
                stroke_bounds
            end
            bounding_box([x_position, y_position - 26], :width => 20, :height => height) do
                text @view.strip_tags(t('character_sheet.miscmodifier')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
            end        
            
            # Touch Armor
            x_position = 0
            (touchac, toucharmorclass) = t('character_sheet.touchac').split('<br />')
            label(@view.strip_tags(touchac), "\n" + @view.strip_tags(toucharmorclass), width, height, [x_position, y_position - 45], LABEL_FONT_SIZE)
            x_position += 45
            bounding_box([x_position, y_position - 45], :width => 25, :height => height) do
                text @character.touchac.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
                stroke_bounds
            end
            
            # Flat Footted armor
             x_position += 30
              (ffArmor, flatFootedArmor) = t('character_sheet.flatfootedac').split('<br />')
              label(@view.strip_tags(ffArmor), "\n" + @view.strip_tags(flatFootedArmor), 45, height, [x_position, y_position - 45], LABEL_FONT_SIZE)
              x_position += 50
              bounding_box([x_position, y_position - 45], :width => 25, :height => height) do
                  text @character.touchac.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
                  stroke_bounds
              end
      end
  end
  
  
  def initiative
      height = 23
      x_position = 0
      y_position = 50
      
      bounding_box([@x_position + 170, @y_position - 80], :width => 20, :height => 50) do
        x_position = 0
        (init, initiative) = t('character_sheet.initiative').split('<br />')
        label(@view.strip_tags(init), "\n" + @view.strip_tags(initiative), 45, height, [x_position, y_position - 35], 6)
      
        x_position += 50
        bounding_box([x_position, y_position - 35], :width => 23, :height => height) do
            text @character.initiative.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
            stroke_bounds
        end
        bounding_box([x_position - 2, y_position - 52], :width => 30, :height => height) do
             text t('character_sheet.totalinit'), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
        end
        
         x_position += 25
         bounding_box([x_position, y_position - 35], :width => 10, :height => height) do
            text " = ", :size => FONT_SIZE, :align => :center, :valign => :center
        end
        
       # Dexterity bonus
       x_position += 12
       bounding_box([x_position, y_position - 35], :width => 23, :height => height) do
           text @character.dexterity_bonus.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
           stroke_bounds
       end
       bounding_box([x_position, y_position - 52], :width => 20, :height => height) do
           text @view.strip_tags(t('character_sheet.dextmodifier')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
       end
       
       # Misc modifier
        x_position += 25
        bounding_box([x_position, y_position - 35], :width => 10, :height => height) do
           text " + ", :size => FONT_SIZE, :align => :center, :valign => :center
        end
       
        x_position += 12
        bounding_box([x_position, y_position - 35], :width => 25, :height => height) do
            text @character.miscinit.to_s, :size => FONT_SIZE, :align => :center, :valign => :center
            stroke_bounds
        end
        bounding_box([x_position, y_position - 52], :width => 20, :height => height) do
            text @view.strip_tags(t('character_sheet.miscinit')), :size => LABEL_FONT_SIZE, :align => :center, :valign => :center
        end
        
      end
  end
  
  def skills
      x_position = 0
      y_position = 15
      
      bounding_box([@x_position + 325, @y_position - 90], :width => 240, :height => 550) do
        
          # Header
          fill_rectangle([0, 555], 240, 20)
          bounding_box([0, 550], :width => 15, :height => 15) do
            formatted_text_box [:text => "Class?", :size => 5, :color => "ffffff", :styles => [:bold]],
                                  :at => [x_position, y_position],
                                  :height => 15, 
                                  :width => 15,
                                  :align => :center,
                                  :valign => :center
                                  
             x_position += 17  
             formatted_text_box [:text => t('character_sheet.skillname'), :size => 6, :color => "ffffff", :styles => [:bold]],
                                    :at => [x_position, y_position],
                                    :height => 15, 
                                    :width => 110,
                                    :align => :center,
                                    :valign => :center
                                    
                                    
              x_position += 110                 
             formatted_text_box [:text => t('character_sheet.skillkeyability').gsub("<br />", "\n"), :size => 6, :color => "ffffff", :styles => [:bold]],
                                :at => [x_position, y_position],
                                :height => 15, 
                                :width => 20,
                                :align => :center,
                                :valign => :center
                  
              x_position += 22                   
              formatted_text_box [:text => t('character_sheet.skillmodifier').gsub("<br />", "\n"), :size => 6, :color => "ffffff", :styles => [:bold]],
                                  :at => [x_position, y_position],
                                  :height => 15, 
                                  :width => 20,
                                  :align => :center,
                                  :valign => :center
                                  
              x_position += 22                    
              formatted_text_box [:text => t('character_sheet.skillabilitymodifier').gsub("<br />", "\n"), :size => 6, :color => "ffffff", :styles => [:bold]],
                                  :at => [x_position, y_position],
                                  :height => 15, 
                                  :width => 20,
                                  :align => :center,
                                  :valign => :center  
                                  
               x_position += 22                   
               formatted_text_box [:text => t('character_sheet.skillranks').gsub("<br />", "\n"), :size => 6, :color => "ffffff", :styles => [:bold]],
                                    :at => [x_position, y_position],
                                    :height => 15, 
                                    :width => 20,
                                    :align => :center,
                                    :valign => :center   
                                    
               x_position += 22                     
              formatted_text_box [:text => t('character_sheet.skillmisc').gsub("<br />", "\n"), :size => 6, :color => "ffffff", :styles => [:bold]],
                                    :at => [x_position, y_position],
                                    :height => 15, 
                                    :width => 20,
                                    :align => :center,
                                    :valign => :center                                                                                         
          end
          
          
          # Skills
          @character.abilities.each_with_index do |ability, index|
                y_position = 530 - (15 * index) + 10
                x_position = 2
                
                # Skill Class?
                if ability.skill_class
                  fill_rectangle([x_position, y_position - 10], 5, 5)
                else
                  stroke_rectangle([x_position, y_position - 10], 5, 5)
                end  
                
                # Skill Name
                x_position += 15
                bounding_box([x_position, y_position], :width => 80, :height => 15) do
                  if ability.skill.parent
                    #text ability.skill.parent.name[0..3] + ". (" + ability.skill.name + ")", :size => 6
                     TextDisplay.new({:document => self, :at => [0, 15]},
                                        [{:text => ability.skill.parent.name[0..3] + ". (" + ability.skill.name + ")", :size => 7}], 
                                        {:width => 110, :height => 15, :valign => :bottom, :align => :left}).render
                  else
                    #text ability.skill.name, :size => 6
                     TextDisplay.new({:document => self, :at => [0, 15]},
                                        [{:text => ability.skill.name, :size => 7}], 
                                        {:width => 80, :height => 15, :valign => :bottom, :align => :left}).render
                  end
                end
                
                # Skill characteristic
                x_position += 110
                bounding_box([x_position, y_position], :width => 17, :height => 15) do
                    #text ability.characteristic_short, :size => 6
                    TextDisplay.new({:document => self, :at => [0, 15]},
                                      [{:text => ability.characteristic_short, :size => 7}], 
                                      {:width => 17, :height => 15, :borders => [:bottom], :valign => :bottom}).render
                end
                
                x_position += 25
                bounding_box([x_position, y_position], :width => 15, :height => 15) do
                   # text ability.skill_modifier.to_s, :size => 6
                    TextDisplay.new({:document => self, :at => [0, 15]},
                                      [{:text => ability.skill_modifier.to_s, :size => FONT_SIZE}], 
                                      {:width => 15, :height => 15, :borders => [:bottom], :valign => :bottom}).render    
                                
                end
                
               x_position += 16
                bounding_box([x_position, y_position], :width => 7, :height => 15) do
                      #text ability.bonus.to_s, :size => 6
                      TextDisplay.new({:document => self, :at => [0, 15]},
                                        [{:text => "=", :size => LABEL_FONT_SIZE}], 
                                        {:width => 7, :height => 15, :valign => :bottom}).render    

                end
                
                x_position += 8
                bounding_box([x_position, y_position], :width => 15, :height => 15) do
                      #text ability.bonus.to_s, :size => 6
                      TextDisplay.new({:document => self, :at => [0, 15]},
                                        [{:text => ability.bonus.to_s, :size => FONT_SIZE}], 
                                        {:width => 15, :height => 15, :borders => [:bottom], :valign => :bottom}).render    
                      
                end
              
              
                 x_position += 16
                  bounding_box([x_position, y_position], :width => 7, :height => 15) do
                        #text ability.bonus.to_s, :size => 6
                        TextDisplay.new({:document => self, :at => [0, 15]},
                                          [{:text => "+", :size => LABEL_FONT_SIZE}], 
                                          {:width => 7, :height => 15, :valign => :bottom}).render
              
                end
                
                x_position += 8
                bounding_box([x_position, y_position], :width => 15, :height => 15) do
                     # text ability.ranks.to_s, :size => 6
                      TextDisplay.new({:document => self, :at => [0, 15]},
                                         [{:text => ability.ranks.to_s, :size => FONT_SIZE}], 
                                         {:width => 15, :height => 15, :valign => :bottom, :borders => [:bottom]}).render
                end
              
               x_position += 16
                bounding_box([x_position, y_position], :width => 7, :height => 15) do
                      #text ability.bonus.to_s, :size => 6
                      TextDisplay.new({:document => self, :at => [0, 15]},
                                        [{:text => "+", :size => LABEL_FONT_SIZE}], 
                                        {:width => 7, :height => 15, :valign => :bottom}).render
                end
                
                x_position += 8
                bounding_box([x_position, y_position], :width => 15, :height => 15) do
                      #text ability.misc.to_s, :size => 6
                       TextDisplay.new({:document => self, :at => [0, 15]},
                                           [{:text => ability.misc.to_s, :size => FONT_SIZE}], 
                                           {:width => 15, :height => 15, :valign => :bottom, :borders => [:bottom]}).render
                end
          end
          
       # stroke_bounds
      end
  end
  
  def saving_throw
      @y_position = 580
      @x_position = 10
      x_position = 0
      y_position = 70
      width = 40
      
      bounding_box([@x_position, @y_position], :width => 280, :height => 90) do
        
       header = [t('character_sheet.savingthrouw'), t('character_sheet.totalsavingthrouw'), t('character_sheet.basesavingthrouw').gsub("<br />", "\n"), t('character_sheet.ability_name').gsub("<br />", "\n"), t('character_sheet.magicsavingthrouw').gsub("<br />", "\n"), t('character_sheet.miscsavingthrouw').gsub("<br />", "\n"), t('character_sheet.tempsavingthrouw').gsub("<br />", "\n")]
        data = [[t('character_sheet.fortitudelabel'), @character.fortitudeTotalSavingThrow, @character.fortitudebasesavingthrow, @character.constitution_bonus, @character.fortitudemagicsavingthrow, @character.fortitudemiscsavingthrow, @character.fortitudetempsavingthrow],
        [t('character_sheet.reflexlabel'), @character.reflexTotalSavingThrow, @character.reflexbasesavingthrow, @character.dexterity_bonus, @character.reflexmagicsavingthrow, @character.reflexmiscsavingthrow, @character.reflextempsavingthrow],
        [t('character_sheet.willlabel'), @character.willTotalSavingThrow, @character.willbasesavingthrow, @character.wisdom_bonus, @character.willmagicsavingthrow, @character.willmiscsavingthrow, @character.willtempsavingthrow]]
        
          header.each_with_index do |item, index| 
            
                 index == 0 ? w = 60 : w = 20
                 formatted_text_box   [{:text => item, :color => "000000", :size => LABEL_FONT_SIZE}],
                                        :at => [x_position, y_position],
                                        :height => 15, 
                                        :width => w,
                                        :align => :center,
                                        :valign => :center  
                  case index
                  when 0                      
                    x_position += w + 10
                  when 1
                    x_position += w + 16
                  else
                    x_position += w + 15
                  end
          end
         
        
         data.each_with_index do |row, idx1|
            y_position -= 22
            x_position = 0
         
            TextDisplay.new({:document => self, :at => [x_position, y_position]},
                             [{:text =>row[0].to_s, :color => 'ffffff', :size => LABEL_FONT_SIZE, :styles => [:bold]}], 
                             {:width => 60, :height => 18, :background_color => "000000"}).render

          
                  
             x_position += 60

             TextDisplay.new({:document => self, :at => [x_position + 8, y_position]},
                              [{:text =>row[1].to_s, :size => FONT_SIZE}], 
                              {:width => 25, :height => 18, :borders => [:bottom, :top, :right, :left]}).render


        
             x_position += 30
             formatted_text_box   [{:text => " = ", :color => "000000", :size => FONT_SIZE}],
                                      :at => [x_position, y_position],
                                      :height => 18, 
                                      :width => 15,
                                      :align => :center,
                                      :valign => :center
          
                                                  
             x_position += 5
             TextDisplay.new({:document => self, :at => [x_position + 8, y_position]},
                              [{:text =>row[2].to_s, :size => FONT_SIZE}], 
                              {:width => 25, :height => 18, :borders => [:bottom, :top, :right, :left]}).render


             x_position += 30
             formatted_text_box   [{:text => " + ", :color => "000000", :size => FONT_SIZE}],
                                      :at => [x_position, y_position],
                                      :height => 18, 
                                      :width => 15,
                                      :align => :center,
                                      :valign => :center                                        
                 
                                      
             x_position += 5    
             TextDisplay.new({:document => self, :at => [x_position + 8, y_position]},
                              [{:text =>row[3].to_s, :size => FONT_SIZE}], 
                              {:width => 25, :height => 18, :borders => [:bottom, :top, :right, :left]}).render

            
            x_position += 30
             formatted_text_box   [{:text => " + ", :color => "000000", :size => FONT_SIZE}],
                                      :at => [x_position, y_position],
                                      :height => 18, 
                                      :width => 15,
                                      :align => :center,
                                      :valign => :center                                        


             x_position += 5
             TextDisplay.new({:document => self, :at => [x_position + 8, y_position]},
                              [{:text =>row[4].to_s, :size => FONT_SIZE}], 
                              {:width => 25, :height => 18, :borders => [:bottom, :top, :right, :left]}).render
                                      
                                      
                                      
                                      
           x_position += 30
             formatted_text_box   [{:text => " + ", :color => "000000", :size => FONT_SIZE}],
                                      :at => [x_position, y_position],
                                      :height => 18, 
                                      :width => 15,
                                      :align => :center,
                                      :valign => :center                                        


             x_position += 5
             TextDisplay.new({:document => self, :at => [x_position + 8, y_position]},
                              [{:text =>row[5].to_s, :size => FONT_SIZE}], 
                              {:width => 25, :height => 18, :borders => [:bottom, :top, :right, :left]}).render
                                      
          
             x_position += 30
             formatted_text_box   [{:text => " + ", :color => "000000", :size => FONT_SIZE}],
                                      :at => [x_position, y_position],
                                      :height => 18, 
                                      :width => 15,
                                      :align => :center,
                                      :valign => :center                                        


             x_position += 5
             TextDisplay.new({:document => self, :at => [x_position + 8, y_position]},
                              [{:text =>row[6].to_s, :size => FONT_SIZE}], 
                              {:width => 25, :height => 18, :borders => [:bottom, :top, :right, :left]}).render
             
         end
      end
  end
  
  def baseAttackSpellResist
      bounding_box [@x_position, @y_position - 110], :width => 250, :height => 30 do
         label(t('character_sheet.baseattack'), '', 40, 25, [0, 30], 6)
         stroke_rectangle([40, 30], 90, 25 )
         formatted_text_box [:text => @character.base_attack.to_s, :size => FONT_SIZE, :color => "000000"],
                             :at => [40, 30],
                             :height => 25, 
                             :width => 90,
                             :align => :center,
                             :valign => :center

          label(t('character_sheet.spellresist'), '', 40, 25, [140, 30], 6)
          stroke_rectangle([150, 30], 70, 25 )
          formatted_text_box [:text => @character.spell_resist.to_s, :size => FONT_SIZE, :color => "000000"],
                              :at => [150, 30],
                              :height => 25, 
                              :width => 70,
                              :align => :center,
                              :valign => :center
      end
  end
  
  def grapple
      x_position = 0
      y_position = 20
      width = 27
      height = 25
      
      bounding_box [@x_position, @y_position - 135], :width => 200, :height => 30 do
      
         label(t('character_sheet.grapple.label'), '', 40, 25, [0, 20], LABEL_FONT_SIZE)
 
         x_position += 40
         stroke_rectangle([x_position, y_position], width, height )
         formatted_text_box   [{:text => @character.totalgrapple.to_s, :color => "000000", :size => FONT_SIZE}],
                               :at => [x_position, y_position],
                               :height => height, 
                               :width => width,
                               :align => :center,
                               :valign => :center                                                                      
                                                                
          formatted_text_box   [{:text => t('character_sheet.grapple.total'), :color => "000000", :size => LABEL_FONT_SIZE}],
                                :at => [x_position, y_position - height],
                                :height => height, 
                                :width => width,
                                :align => :center,
                                :valign => :center
                                
        #=>                       
        x_position += 25                            
       formatted_text_box   [{:text => " = ", :color => "000000", :size => LABEL_FONT_SIZE}],
                              :at => [x_position, y_position],
                              :height => height, 
                              :width => 10,
                              :align => :center,
                              :valign => :center
                                
        x_position += 10
        stroke_rectangle([x_position, y_position], width, height )
        formatted_text_box   [{:text => @character.strength_bonus.to_s, :color => "000000", :size => FONT_SIZE}],
                              :at => [x_position, y_position],
                              :height => height, 
                              :width => width,
                              :align => :center,
                              :valign => :center
                              
       formatted_text_box   [{:text => t('character_sheet.grapple.strengthmodifier').gsub("<br />", "\n"), :color => "000000", :size => LABEL_FONT_SIZE}],
                              :at => [x_position, y_position - height],
                              :height => height, 
                              :width => width,
                              :align => :center,
                              :valign => :center  
                              
                              
       #=>                     
       x_position += 25                            
       formatted_text_box   [{:text => " + ", :color => "000000", :size => LABEL_FONT_SIZE}],
                              :at => [x_position, y_position],
                              :height => height, 
                              :width => 10,
                              :align => :center,
                              :valign => :center

        x_position += 10
        stroke_rectangle([x_position, y_position], width, height )
        formatted_text_box   [{:text => @character.attacks[0][1].to_s, :color => "000000", :size => FONT_SIZE}],
                              :at => [x_position, y_position],
                              :height => height, 
                              :width => width,
                              :align => :center,
                              :valign => :center

       formatted_text_box   [{:text => t('character_sheet.grapple.baseattack').gsub("<br />", "\n"), :color => "000000", :size => LABEL_FONT_SIZE}],
                              :at => [x_position, y_position - height],
                              :height => height, 
                              :width => width,
                              :align => :center,
                              :valign => :center
                              
       #=>                             
       x_position += 25                            
       formatted_text_box   [{:text => " + ", :color => "000000", :size => LABEL_FONT_SIZE}],
                              :at => [x_position, y_position],
                              :height => height, 
                              :width => 10,
                              :align => :center,
                              :valign => :center

        x_position += 10
        stroke_rectangle([x_position, y_position], width, height )
        formatted_text_box   [{:text => @character.sizemodifier.to_s, :color => "000000", :size => FONT_SIZE}],
                              :at => [x_position, y_position - 3],
                              :height => height, 
                              :width => width,
                              :align => :center,
                              :valign => :center

       formatted_text_box   [{:text => t('character_sheet.grapple.sizemodifier').gsub("<br />", "\n"), :color => "000000", :size => LABEL_FONT_SIZE}],
                              :at => [x_position, y_position - height],
                              :height => height, 
                              :width => width,
                              :align => :center,
                              :valign => :center                        
        
        
        
       #=>                             
       x_position += 25                            
       formatted_text_box   [{:text => " + ", :color => "000000", :size => LABEL_FONT_SIZE}],
                              :at => [x_position, y_position],
                              :height => height, 
                              :width => 10,
                              :align => :center,
                              :valign => :center

        x_position += 10
        stroke_rectangle([x_position, y_position], width, height )
        formatted_text_box   [{:text => @character.grapplemisc.to_s, :color => "000000", :size => FONT_SIZE}],
                              :at => [x_position, y_position],
                              :height => height, 
                              :width => width,
                              :align => :center,
                              :valign => :center

       formatted_text_box   [{:text => t('character_sheet.grapple.miscmodifier').gsub("<br />", "\n"), :color => "000000", :size => LABEL_FONT_SIZE}],
                              :at => [x_position, y_position - height],
                              :height => height, 
                              :width => width,
                              :align => :center,
                              :valign => :center  
                               
      end
  end
  
  def weapons
      @x_position = 10
      
      y_position = 150
      width = 25
      height = 25 
      
      bounding_box [@x_position, @y_position - 210], :width => 200, :height => 150 do    
        
        @character.weapons.each_with_index do |weapon, index|
           x_position = 0
           y_position = 150 - (index * 80)
           
           TextDisplay.new({:document => self, :at => [x_position, y_position], :label_position => :top},
                           [{:text => weapon.attack, :color => '000000', :size => FONT_SIZE}], 
                           {:background_color => "ffffff", :width => 150, :height => height, :borders => [:left, :right, :bottom, :top]},
                           [{:text => t('character_sheet.weapon.label'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                           {:background_color => "000000", :width => 150, :height => WEAPON_LABEL_HEIGHT}).render
                           
          x_position += 150                 
         TextDisplay.new({:document => self, :at => [x_position, y_position], :label_position => :top},
                          [{:text => weapon.bonus.to_s, :color => '000000', :size => FONT_SIZE}], 
                          {:background_color => "ffffff", :width => 50, :height => height, :borders => [:left, :right, :bottom, :top]},
                          [{:text => t('character_sheet.weapon.bonus'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                          {:background_color => "000000", :width => 50, :height => WEAPON_LABEL_HEIGHT}).render
                          
         x_position += 50                 
         TextDisplay.new({:document => self, :at => [x_position, y_position], :label_position => :top},
                          [{:text => weapon.dammage.to_s, :color => '000000', :size => FONT_SIZE}], 
                          {:background_color => "ffffff", :width => 50, :height => height, :borders => [:left, :right, :bottom, :top]},
                          [{:text => t('character_sheet.weapon.dammage'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                          {:background_color => "000000", :width => 50, :height => WEAPON_LABEL_HEIGHT}).render
                                                                              
          x_position += 50                 
           TextDisplay.new({:document => self, :at => [x_position, y_position], :label_position => :top},
                            [{:text => weapon.critical.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 50, :height => height, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.weapon.critical'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                            {:background_color => "000000", :width => 50, :height => WEAPON_LABEL_HEIGHT}).render
                            
                            
           x_position = 0                 
           TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)], :label_position => :top},
                          [{:text => weapon.range.to_s, :color => '000000', :size => FONT_SIZE}], 
                          {:background_color => "ffffff", :width => 60, :height => height, :borders => [:left, :right, :bottom, :top]},
                          [{:text => t('character_sheet.weapon.range'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                          {:background_color => "000000", :width => 60, :height => WEAPON_LABEL_HEIGHT}).render
                          
             x_position += 60                 
             TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)], :label_position => :top},
                            [{:text => weapon.weapon_type.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 60, :height => height, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.weapon.type'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                            {:background_color => "000000", :width => 60, :height => WEAPON_LABEL_HEIGHT}).render
                            
            x_position += 60                 
             TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)], :label_position => :top},
                            [{:text => weapon.notes.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 180, :height => height, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.weapon.notes'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                            {:background_color => "000000", :width => 180, :height => WEAPON_LABEL_HEIGHT}).render           
                          
        end

      end

  end
  
  def protection
    x_position = 0
    y_position = 150
    height = 20
    
     bounding_box [@x_position, @y_position + 170], :width => 200, :height => 150 do  
       @character.gears.each_with_index do |gear, index|
         y_position = 180 - (index * 70)
         case gear.category
         when "armor"
          
           TextDisplay.new({:document => self, :at => [x_position, y_position], :label_position => :top},
                            [{:text => gear.protective_item.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 160, :height => height, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.gear.armor_item'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                            {:background_color => "000000", :width => 160, :height => WEAPON_LABEL_HEIGHT}).render
            
            x_position += 160
            TextDisplay.new({:document => self, :at => [x_position, y_position], :label_position => :top},
                              [{:text => gear.type.to_s, :color => '000000', :size => FONT_SIZE}], 
                              {:background_color => "ffffff", :width => 40, :height => height, :borders => [:left, :right, :bottom, :top]},
                              [{:text => t('character_sheet.gear.type'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                              {:background_color => "000000", :width => 40, :height => WEAPON_LABEL_HEIGHT}).render
                              
             x_position += 40
              TextDisplay.new({:document => self, :at => [x_position, y_position], :label_position => :top},
                                [{:text => gear.ac_bonus.to_s, :color => '000000', :size => FONT_SIZE}], 
                                {:background_color => "ffffff", :width => 30, :height => height, :borders => [:left, :right, :bottom, :top]},
                                [{:text => t('character_sheet.gear.ac_bonus'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                                {:background_color => "000000", :width => 30, :height => WEAPON_LABEL_HEIGHT}).render
            
             x_position += 30
              TextDisplay.new({:document => self, :at => [x_position, y_position], :label_position => :top},
                                [{:text => gear.max_dex.to_s, :color => '000000', :size => FONT_SIZE}], 
                                {:background_color => "ffffff", :width => 30, :height => height, :borders => [:left, :right, :bottom, :top]},
                                [{:text => t('character_sheet.gear.max_dex'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                                {:background_color => "000000", :width => 30, :height => WEAPON_LABEL_HEIGHT}).render    
                
                
             x_position = 0
             TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)], :label_position => :top},
                             [{:text => gear.check_penalty.to_s, :color => '000000', :size => FONT_SIZE}], 
                             {:background_color => "ffffff", :width => 60, :height => height, :borders => [:left, :right, :bottom, :top]},
                             [{:text => t('character_sheet.gear.check_penalty'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                             {:background_color => "000000", :width => 60, :height => WEAPON_LABEL_HEIGHT}).render
                          
            x_position += 60          
            TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)],:label_position => :top},
                          [{:text => gear.spell_failure.to_s, :color => '000000', :size => FONT_SIZE}], 
                          {:background_color => "ffffff", :width => 40, :height => height, :borders => [:left, :right, :bottom, :top]},
                          [{:text => t('character_sheet.gear.spell_failure'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                          {:background_color => "000000", :width => 40, :height => WEAPON_LABEL_HEIGHT}).render
                          
            x_position += 40          
            TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)],:label_position => :top},
                          [{:text => gear.speed.to_s, :color => '000000', :size => FONT_SIZE}], 
                          {:background_color => "ffffff", :width => 30, :height => height, :borders => [:left, :right, :bottom, :top]},
                          [{:text => t('character_sheet.gear.speed'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                          {:background_color => "000000", :width => 30, :height => WEAPON_LABEL_HEIGHT}).render                                                    
                          
           x_position += 30          
            TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)],:label_position => :top},
                          [{:text => gear.weight.to_s, :color => '000000', :size => FONT_SIZE}], 
                          {:background_color => "ffffff", :width => 30, :height => height, :borders => [:left, :right, :bottom, :top]},
                          [{:text => t('character_sheet.gear.weight'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                          {:background_color => "000000", :width => 30, :height => WEAPON_LABEL_HEIGHT}).render                   
                                                                                
           x_position += 30          
            TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)],:label_position => :top},
                          [{:text => gear.special_properties.to_s, :color => '000000', :size => FONT_SIZE}], 
                          {:background_color => "ffffff", :width => 100, :height => height, :borders => [:left, :right, :bottom, :top]},
                          [{:text => t('character_sheet.gear.special_properties'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                          {:background_color => "000000", :width => 100, :height => WEAPON_LABEL_HEIGHT}).render       
         when "shield"
      
          x_position = 0          
          TextDisplay.new({:document => self, :at => [x_position, y_position],:label_position => :top},
                        [{:text => gear.protective_item.to_s, :color => '000000', :size => FONT_SIZE}], 
                        {:background_color => "ffffff", :width => 140, :height => height, :borders => [:left, :right, :bottom, :top]},
                        [{:text => t('character_sheet.gear.shield_item'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                        {:background_color => "000000", :width => 140, :height => WEAPON_LABEL_HEIGHT}).render
  
          x_position += 140          
          TextDisplay.new({:document => self, :at => [x_position, y_position],:label_position => :top},
                        [{:text => gear.protective_item.to_s, :color => '000000', :size => FONT_SIZE}], 
                        {:background_color => "ffffff", :width => 30, :height => height, :borders => [:left, :right, :bottom, :top]},
                        [{:text => t('character_sheet.gear.shield_item'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                        {:background_color => "000000", :width => 30, :height => WEAPON_LABEL_HEIGHT}).render

          x_position += 30          
          TextDisplay.new({:document => self, :at => [x_position, y_position],:label_position => :top},
                        [{:text => gear.weight.to_s, :color => '000000', :size => FONT_SIZE}], 
                        {:background_color => "ffffff", :width => 30, :height => height, :borders => [:left, :right, :bottom, :top]},
                        [{:text => t('character_sheet.gear.weight'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                        {:background_color => "000000", :width => 30, :height => WEAPON_LABEL_HEIGHT}).render          
                        
                      
          x_position += 30          
          TextDisplay.new({:document => self, :at => [x_position, y_position],:label_position => :top},
                        [{:text => gear.check_penalty.to_s, :color => '000000', :size => FONT_SIZE}], 
                        {:background_color => "ffffff", :width => 60, :height => height, :borders => [:left, :right, :bottom, :top]},
                        [{:text => t('character_sheet.gear.check_penalty'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                        {:background_color => "000000", :width => 60, :height => WEAPON_LABEL_HEIGHT}).render
                        
          
          x_position = 0          
          TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)],:label_position => :top},
                        [{:text => gear.spell_failure.to_s, :color => '000000', :size => FONT_SIZE}], 
                        {:background_color => "ffffff", :width => 40, :height => height, :borders => [:left, :right, :bottom, :top]},
                        [{:text => t('character_sheet.gear.spell_failure'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                        {:background_color => "000000", :width => 40, :height => WEAPON_LABEL_HEIGHT}).render
              
          x_position += 40          
          TextDisplay.new({:document => self, :at => [x_position, y_position - (WEAPON_LABEL_HEIGHT + height)],:label_position => :top},
                        [{:text => gear.special_properties.to_s, :color => '000000', :size => FONT_SIZE}], 
                        {:background_color => "ffffff", :width => 220, :height => height, :borders => [:left, :right, :bottom, :top]},
                        [{:text => t('character_sheet.gear.special_properties'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                        {:background_color => "000000", :width => 220, :height => WEAPON_LABEL_HEIGHT}).render                     
                        
         else
             x_position = 0          
             TextDisplay.new({:document => self, :at => [x_position, y_position],:label_position => :top},
                           [{:text => gear.protective_item.to_s, :color => '000000', :size => FONT_SIZE}], 
                           {:background_color => "ffffff", :width => 180, :height => height, :borders => [:left, :right, :bottom, :top]},
                           [{:text => t('character_sheet.gear.protective_item'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                           {:background_color => "000000", :width => 180, :height => WEAPON_LABEL_HEIGHT}).render
                           
                           
             x_position += 180          
             TextDisplay.new({:document => self, :at => [x_position, y_position],:label_position => :top},
                           [{:text => gear.ac_bonus.to_s, :color => '000000', :size => FONT_SIZE}], 
                           {:background_color => "ffffff", :width => 40, :height => height, :borders => [:left, :right, :bottom, :top]},
                           [{:text => t('character_sheet.gear.ac_bonus'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                           {:background_color => "000000", :width => 40, :height => WEAPON_LABEL_HEIGHT}).render
                           
                           
             x_position += 40         
             TextDisplay.new({:document => self, :at => [x_position, y_position],:label_position => :top},
                           [{:text => gear.weight.to_s, :color => '000000', :size => FONT_SIZE}], 
                           {:background_color => "ffffff", :width => 40, :height => height, :borders => [:left, :right, :bottom, :top]},
                           [{:text => t('character_sheet.gear.weight'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                           {:background_color => "000000", :width => 40, :height => WEAPON_LABEL_HEIGHT}).render
          
             x_position = 0     
             y_position -= WEAPON_LABEL_HEIGHT + height    
             TextDisplay.new({:document => self, :at => [x_position, y_position],:label_position => :top},
                           [{:text => gear.special_properties.to_s, :color => '000000', :size => FONT_SIZE}], 
                           {:background_color => "ffffff", :width => 260, :height => height, :borders => [:left, :right, :bottom, :top]},
                           [{:text => t('character_sheet.gear.special_properties'), :color => 'ffffff', :size => LABEL_FONT_SIZE}],
                           {:background_color => "000000", :width => 260, :height => WEAPON_LABEL_HEIGHT}).render
                           
                            
         end # end of case category
      end # end of each gear
    end # end of bounding box 
  end

  def possessions
     x_position = 0
     y_position = 150
     height = 15
     
     bounding_box [@x_position, @y_position - 80], :width => 240, :height => 150 do 
         y_position = 150
         TextDisplay.new({:document => self, :at => [x_position, y_position]},
                         [{:text => t('character_sheet.possession.item'), :color => 'ffffff', :size => FONT_SIZE}], 
                         {:background_color => "000000", :color => "ffffff", :width => 110, :height => height, :borders => [:left, :right, :bottom, :top]}).render
          
         x_position += 110          
         TextDisplay.new({:document => self, :at => [x_position, y_position]},
                         [{:text => t('character_sheet.possession.weight'), :color => 'ffffff', :size => FONT_SIZE}], 
                         {:background_color => "000000", :color => "ffffff", :width => 20, :height => height, :borders => [:left, :right, :bottom, :top]}).render 
                       

         x_position += 20                       
         TextDisplay.new({:document => self, :at => [x_position, y_position]},
                         [{:text => t('character_sheet.possession.item'), :color => 'ffffff', :size => FONT_SIZE}], 
                         {:background_color => "000000", :color => "ffffff", :width => 110, :height => height, :borders => [:left, :right, :bottom, :top]}).render
                     
         x_position += 110             
         TextDisplay.new({:document => self, :at => [x_position, y_position]},
                         [{:text => t('character_sheet.possession.weight'), :color => 'ffffff', :size => FONT_SIZE}], 
                         {:background_color => "000000", :width => 20, :height => height, :borders => [:left, :right, :bottom, :top]}).render               
       
                       
           @character.possessions.each_with_index do |possession, index|
                                      
             if index >=  (@character.possessions.count / 2).round
               x_position = 130
               y_position = 135 - ((index - @character.possessions.count / 2) * height)
             else             
               x_position = 0
               y_position = 135 - (index * height)
             end
                      
             TextDisplay.new({:document => self, :at => [x_position, y_position]},
                            [{:text => possession.item.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 110, :height => height, :borders => [:left, :right, :bottom, :top]}).render
                  
              x_position += 110          
              TextDisplay.new({:document => self, :at => [x_position, y_position]},
                            [{:text => possession.weight.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 20, :height => height, :borders => [:left, :right, :bottom, :top]}).render                
           end
           
           x_position = 0        
           y_position -= height  
           bounding_box [x_position, y_position], :width => 260, :height => 25 do          
            TextDisplay.new({:document => self, :at => [0, 20]},
                           [{:text => t('character_sheet.possession.total_load'), :color => '000000', :size => FONT_SIZE}], 
                           {:background_color => "ffffff", :width => 60, :height => height, :borders => []}).render
             
            x_position += 230
            TextDisplay.new({:document => self, :at => [x_position, 20]},
                           [{:text => @character.total_load.to_s, :color => '000000', :size => FONT_SIZE}], 
                           {:background_color => "ffffff", :width => 20, :height => height, :borders => [:left, :right, :bottom, :top]}).render
                           
             stroke_bounds
          end
          
          
          x_position = 0
          y_position -= 25
          bounding_box [x_position, y_position], :width => 260, :height => 45 do       
             
             TextDisplay.new({:document => self, :at => [x_position + 5, y_position + 170],:label_position => :bottom},
                            [{:text => @character.light_load.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 30, :height => 20, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.possession.light_load').gsub("<br />", "\n"), :color => '000000', :size => LABEL_FONT_SIZE}],
                            {:background_color => "ffffff", :width => 30}).render
                            
            x_position += 44                        
            TextDisplay.new({:document => self, :at => [x_position + 5, y_position + 170],:label_position => :bottom},
                            [{:text => @character.medium_load.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 30, :height => 20, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.possession.medium_load').gsub("<br />", "\n"), :color => '000000', :size => LABEL_FONT_SIZE}],
                            {:background_color => "ffffff", :width => 30}).render                            
 
            x_position += 44                                    
            TextDisplay.new({:document => self, :at => [x_position + 5, y_position + 170],:label_position => :bottom},
                            [{:text => @character.heavy_load.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 30, :height => 20, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.possession.heavy_load').gsub("<br />", "\n"), :color => '000000', :size => LABEL_FONT_SIZE}],
                            {:background_color => "ffffff", :width => 30}).render

            x_position += 44                                                    
            TextDisplay.new({:document => self, :at => [x_position + 5, y_position + 170],:label_position => :bottom},
                            [{:text => @character.lift_over_head.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 30, :height => 20, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.possession.lift_over_head').gsub("<br />", "\n"), :color => '000000', :size => LABEL_FONT_SIZE}],
                            {:background_color => "ffffff", :width => 30}).render                
 
            x_position += 44                                                                               
            TextDisplay.new({:document => self, :at => [x_position + 5, y_position + 170],:label_position => :bottom},
                            [{:text => @character.lift_off_ground.to_s, :color => '000000', :size => FONT_SIZE}], 
                            {:background_color => "ffffff", :width => 30, :height => 20, :borders => [:left, :right, :bottom, :top]},
                            [{:text => t('character_sheet.possession.lift_off_ground').gsub("<br />", "\n"), :color => '000000', :size => LABEL_FONT_SIZE}],
                            {:background_color => "ffffff", :width => 30}).render

             x_position += 44                                      
             TextDisplay.new({:document => self, :at => [x_position + 5, y_position + 170],:label_position => :bottom},
                              [{:text => @character.push_or_drag.to_s, :color => '000000', :size => FONT_SIZE}], 
                              {:background_color => "ffffff", :width => 30, :height => 20, :borders => [:left, :right, :bottom, :top]},
                              [{:text => t('character_sheet.possession.push_or_drag').gsub("<br />", "\n"), :color => '000000', :size => LABEL_FONT_SIZE}],
                              {:background_color => "ffffff", :width => 30}).render
                            
             stroke_bounds              
          end  
     end
  end
  
  # Utility method
  def draw_checkbox(class_skill)
    if class_skill
      fill_rectangle([0, 0], 5, 5)
    else
      stroke_rectangle([0, 0], 5, 5)
    end
  end
  
  
  def display_column(label, value, size)
  #   move_down(7) if value.to_s.empty?
  #   text value.to_s, :size => FONT_SIZE
  #   line_width HEADER_LINE_WIDTH
  #   stroke_horizontal_line 0, size
  #   move_down(2)
  #   text "<color rgb='999999'>" + label + "</color>", :inline_format => true, :size => HEADER_LABEL_FONT_SIZE
     
      TextDisplay.new({:document => self, :at => [0, 22], :label_position => :bottom},
                       [{:text => value.to_s, :color => '000000', :size => FONT_SIZE}], 
                       {:width => size, :height => 15, :borders => [:bottom], :valign => :bottom},
                       [{:text => label, :color => '4c0b10', :size => HEADER_LABEL_FONT_SIZE, :styles => [:bold]}],
                       {:width => size, :height => 10, :align => :left}).render
  end
   
  def label(text, note, width, height, positions, font_size)
    fill_rectangle(positions,width, height )
    formatted_text_box   [{:text => text, :color => "ffffff", :size => font_size, :styles => [:bold]}, 
                           {:text => note, :color => "ffffff", :size => font_size - 2, :styles => [:bold]}],
                          :at => positions,
                          :height => height, 
                          :width => width,
                          :align => :center,
                          :valign => :center
  end

end
