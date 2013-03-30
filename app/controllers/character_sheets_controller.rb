class CharacterSheetsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /character_sheets
  # GET /character_sheets.json
  def index
    @character_sheets = CharacterSheet.all 
    @character_sheet = @character_sheets.first 
    @skills = Skill.all
    @abilities = @character_sheet.abilities if @character_sheet
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @character_sheets }
    end
  end

  # GET /character_sheets/1
  # GET /character_sheets/1.json
  def show
    @character_sheet = CharacterSheet.find(params[:id])
    @character_sheets = CharacterSheet.all 
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character_sheet }
      format.pdf do
          pdf = Sheet.new(@character_sheet, view_context)
          send_data pdf.render, filename: "character_sheet_#{ @character_sheet.name}.pdf",
                                type: "application/pdf",
                                disposition: "inline"                                                                                   
      end
    end
  end

  # GET /character_sheets/new
  # GET /character_sheets/new.json
  def new
    @character_sheet = CharacterSheet.new
    @character_sheets = CharacterSheet.all
    @skills = Skill.where(:parent_id => nil)

    @skills.each do |skill| 
       if skill.children?
          4.times {|i| @character_sheet.abilities.build(skill_id: skill.children[i].id) }           
       else
         @character_sheet.abilities.build(skill_id: skill.id)
       end       
    end
    
    # weapon
    4.times {|i| @character_sheet.weapons.build }
    
    # gears
    %w(armor shield other other).each {|category| @character_sheet.gears.build(category: category) }
    
    # possesions
    32.times { @character_sheet.possessions.build }
    
    # feats
    12.times { @character_sheet.feats.build }
    
    #special abilities
    18.times { @character_sheet.special_abilities.build }
    
    # Languages
    7.times { @character_sheet.languages.build }
    
    #spells
    10.times {|level| @character_sheet.spells.build(level: level)  }
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character_sheet }
    end
  end
  
  # GET /character_sheets/1/edit
  def edit
    @character_sheet = CharacterSheet.find(params[:id])
  end

  # POST /character_sheets
  # POST /character_sheets.json
  def create
    @character_sheet = CharacterSheet.new(params[:character_sheet])

    respond_to do |format|
      if @character_sheet.save
        format.html { redirect_to @character_sheet, notice: 'Character sheet was successfully created.' }
        format.json { render json: @character_sheet, status: :created, location: @character_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @character_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /character_sheets/1
  # PUT /character_sheets/1.json
  def update
    @character_sheet = CharacterSheet.find(params[:id])

    respond_to do |format|
      if @character_sheet.update_attributes(params[:character_sheet])
        format.html { redirect_to @character_sheet, notice: 'Character sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_sheets/1
  # DELETE /character_sheets/1.json
  def destroy
    @character_sheet = CharacterSheet.find(params[:id])
    @character_sheet.destroy

    respond_to do |format|
      format.html { redirect_to character_sheets_url }
      format.json { head :no_content }
    end
  end
  
  def dexterity_update 
     @character_sheet = CharacterSheet.find(params[:id])
     
     if params[:dexterity]
         @dexterity = params[:dexterity]
         @character_sheet.dexterity = @dexterity 
     else
         @dexterity = params[:temporarydexterity]
         @character_sheet.temporarydexterity = @dexterity
     end
     
     respond_to do |format|
        format.js
     end
  end
  
  def strength_update 
      @character_sheet = CharacterSheet.find(params[:id])
      
      if params[:strength]
        @strength = params[:strength]
        @character_sheet.strength = @strength 
      else
        @strength = params[:temporarystrength]
        @character_sheet.temporarystrength = @strength
      end

      respond_to do |format|
         format.js
      end
   end
   
   def constitution_update 
       @character_sheet = CharacterSheet.find(params[:id])

       if params[:constitution]
         @constitution = params[:constitution]
         @character_sheet.constitution = @constitution 
       else
         @constitution = params[:temporaryconstitution]
         @character_sheet.temporaryconstitution = @constitution
       end

       respond_to do |format|
          format.js
       end
    end
    
     def intelligence_update 
         @character_sheet = CharacterSheet.find(params[:id])

         if params[:intelligence]
           @intelligence = params[:intelligence]
           @character_sheet.intelligence = @intelligence 
         else
           @intelligence = params[:temporaryintelligence]
           @character_sheet.temporaryintelligence = @intelligence
         end

         respond_to do |format|
            format.js
         end
      end
  
      def wisdom_update 
          @character_sheet = CharacterSheet.find(params[:id])

          if params[:wisdom]
            @wisdom = params[:wisdom]
            @character_sheet.wisdom = @wisdom 
          else
            @wisdom = params[:temporarywisdom]
            @character_sheet.temporarywisdom = @wisdom
          end

          respond_to do |format|
             format.js
          end
       end
       
      def charisma_update 
           @character_sheet = CharacterSheet.find(params[:id])

           if params[:charisma]
             @charisma = params[:charisma]
             @character_sheet.charisma = @charisma 
           else
             @charisma = params[:temporarycharisma]
             @character_sheet.temporarycharisma = @charisma
           end

           respond_to do |format|
              format.js
           end
        end
        
        # def skill_update
        #          
        #          
        #          respond_to do |format|
        #              format.js
        #           end      
        #        end
end
