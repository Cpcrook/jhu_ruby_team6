# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  #this code equalizes the heights of the .thumbnail divs
  maxHeightCaption = 0
  maxHeightPicture = 0

  $('.thumbnail.caption').each ->
    maxHeightCaption = $(@).height() if $(@).height() > maxHeightCaption

  $('.thumbnail.caption').each ->
    $(@).height maxHeightCaption

  $('.thumbnail.photo').each ->
    maxHeightPicture = $(@).height() if $(@).height() > maxHeightPicture

  $('.thumbnail.photo').each ->
    $(@).height maxHeightPicture
