
$(function(){
	
	$('#link_submit_form').click(function(){
	    $('form').submit();
	    return false;
	});
	
	// Strength
	$("#strengthmodifier").change(function(){
		$(this).attr("href", "/character_sheets/strength_update?strength=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	$("#temporarystrengthmodifier").change(function(){
		$(this).attr("href", "/character_sheets/strength_update?temporarystrength=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	// Dexterity
	$("#dexteritymodifier").change(function(){
		$(this).attr("href", "/character_sheets/dexterity_update?dexterity=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	$("#temporarydexteritymodifier").change(function(){
		$(this).attr("href", "/character_sheets/dexterity_update?temporarydexterity=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	// Constitution
	$("#constitutionmodifier").change(function(){
		$(this).attr("href", "/character_sheets/constitution_update?constitution=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	$("#temporaryconstitutionmodifier").change(function(){
		$(this).attr("href", "/character_sheets/constitution_update?temporaryconstitution=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	// Intelligence
	$("#intelligencemodifier").change(function(){
		$(this).attr("href", "/character_sheets/intelligence_update?intelligence=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	$("#temporaryintelligencemodifier").change(function(){
		$(this).attr("href", "/character_sheets/intelligence_update?temporaryintelligence=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	// Wisdom
	$("#wisdommodifier").change(function(){
		$(this).attr("href", "/character_sheets/wisdom_update?wisdom=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	$("#temporarywisdommodifier").change(function(){
		$(this).attr("href", "/character_sheets/wisdom_update?temporarywisdom=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	// Charisma
	$("#charismammodifier").change(function(){
		$(this).attr("href", "/character_sheets/charisma_update?charisma=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});
	
	$("#temporarycharismamodifier").change(function(){
		$(this).attr("href", "/character_sheets/charisma_update?temporarycharisma=" + $(this).val() + "&id=" + $("#characterSheetId").val());
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );		         
	});	
	
	// Skills
	$("#skills input").change(function(){		
		var skillmiscval;
		var skillranksval;
		var skillabilitymodifierval;
		
		var skillModifier;
		var skillabilitymodifier;
		var skillranks;
		var skillmisc;
		
		// Get the inputs
		skillModifier = $(this).closest("tr").children("td.skillmodifier").children("input");
		skillabilitymodifier = $(this).closest("tr").children("td.skillabilitymodifier").children("input");
		skillranks = $(this).closest("tr").children("td.skillranks").children("input");				
		skillmisc = $(this).closest("tr").children("td.skillmisc").children("input");
		
		// Get the value of hte inputs or 0 if empty
		skillmiscval = parseInt(skillmisc.val()) || 0;
		skillranksval = parseInt(skillranks.val()) || 0;
		skillabilitymodifierval = parseInt(skillabilitymodifier.val()) || 0;
		
		// Calculate the new value
		var result = skillmiscval + skillranksval + skillabilitymodifierval;
		skillModifier.val(result);
	});
	
});
