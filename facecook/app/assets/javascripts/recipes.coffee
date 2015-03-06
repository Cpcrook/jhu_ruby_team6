# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  maxHeightCaption = 0
  maxHeightPicture = 0

  $('.caption').each ->
    maxHeightCaption = $(@).height() if $(@).height() > maxHeightCaption

  $('.caption').each ->
    $(@).height maxHeightCaption

  $('.thumbnail.photo').each ->
    maxHeightPicture = $(@).height() if $(@).height() > maxHeightPicture

  $('.thumbnail.photo').each ->
    $(@).height maxHeightPicture
