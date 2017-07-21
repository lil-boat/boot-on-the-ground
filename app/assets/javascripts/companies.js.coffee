# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
	new AvatarCrop() 

class AvatarCrop
	constructor: -> 
		width = parseInt($('#cropbox').width())
		height = parseInt($('#cropbox').height())
		$('#cropbox').Jcrop
			aspectRatio: 1
			setSelect: [0, 0, width, height]
			onSelect: @update
			onChange: @update

	update: (coords) => 
		$("#company_crop_x").val(coords.x)
		$("#company_crop_y").val(coords.y)
		$("#company_crop_w").val(coords.w)
		$("#company_crop_h").val(coords.h)
		@updatePreview(coords)

	updatePreview: (coords) =>
    $('#preview').css
        width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
        height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
        marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
        marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'