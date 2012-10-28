
$(function(){
	
	$("#dexterityinput").change(function(){
		$(this).attr("href", "/character_sheets/dexterity_update?dexterity=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	
});

// CharacterSheet namespace
CharacterSheetNS = {}

// CahracterSheet class
CharacterSheetNS.CharacterSheet = function(){
	
	this.UpdateDexterity = function(value){
		
	}
}
