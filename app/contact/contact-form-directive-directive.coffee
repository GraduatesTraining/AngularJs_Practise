'use strict'
###*
 # @ngdoc directive
 # @name contact.directive:contactFormDirective
 # @restrict EA
 # @element

 # @description

 # @example
   <example module="contact">
     <file name="index.html">
      <contact-form-directive></contact-form-directive>
     </file>
   </example>

###
class ContactFormDirective
  @$inject=['CommentsFactory']
  constructor: (CommentsFactory) ->
    return {
      restrict: 'AE'
      templateUrl: 'contact/contact-form-directive-directive.tpl.html'
      replace: false
      scope: false
     
    }

angular
  .module('contact')
  .directive 'contactFormDirective', ContactFormDirective
