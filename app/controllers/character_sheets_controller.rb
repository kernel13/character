class CharacterSheetsController < ApplicationController
  # GET /character_sheets
  # GET /character_sheets.json
  def index
    @character_sheets = CharacterSheet.all
    @character_sheet = @character_sheets.first 
    @skills = Skill.all
    
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
    @skills = Skill.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character_sheet }
    end
  end

  # GET /character_sheets/new
  # GET /character_sheets/new.json
  def new
    @character_sheet = CharacterSheet.new
    @character_sheets = CharacterSheet.all
    @skills = Skill.all
    
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
end
