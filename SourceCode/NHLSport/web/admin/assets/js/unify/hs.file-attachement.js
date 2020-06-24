/**
 * File attachment wrapper.
 *
 * @author Htmlstream
 * @version 1.0
 *
 */
;
(function($) {
	'use strict';

	$.HSCore.components.HSFileAttachment = {
		/**
		 *
		 *
		 * @var Object _baseConfig
		 */
		_baseConfig: {
			changeInput: '<div class="u-file-attach-v3 g-mb-15">\
               				<h3 class="g-font-size-16 g-color-gray-dark-v2 mb-0">Drop files here or <span class="g-color-primary">Browse your device</span></h3>\
               				<p class="g-font-size-14 g-color-gray-light-v2 mb-0">Maximum file size 10mb</p>\
              			</div>',
			showThumbs: true,
			templates: {
				box: '<div class="js-result-list row"></div>',
				item: '<div class="js-result-list__item col-md-3 text-center">\
	              <div class="g-pa-10 g-brd-around g-brd-gray-light-v2">\
					<h3 class="g-font-size-16 g-color-gray-dark-v2 g-mb-5">{{fi-name}} <i class="js-result-list-item-remove fas fa-times"></i></h3>\
	                <p class="g-font-size-12 g-color-gray-light-v2 g-mb-5">{{fi-size2}}</p>\
					<div class="g-mb-10">{{fi-image}}</div>\
	              </div>\
	             </div>',
				itemAppend: '<div class="js-result-list__item col-md-3">\
	                    <div class="g-pa-10 g-brd-around g-brd-gray-light-v2">\
	                      <h3 class="g-font-size-16 g-color-gray-dark-v2 g-mb-5">{{fi-name}}</h3>\
	                      <p class="g-font-size-12 g-color-gray-light-v2 g-mb-5">{{fi-size2}}</p>\
	                      <div class="g-mb-10">{{fi-image}}</div>\
	                      <div class="text-left">{{fi-progressBar}}</div>\
	                      <div>{{fi-icon}}</div>\
	                      <div><i class="js-result-list-item-remove fas fa-time"></i></div>\
	                    </div>\
	                   </div>',
				progressBar: '<progress class="u-progress-bar-v1"></progress>',
				_selectors: {
					list: '.js-result-list',
					item: '.js-result-list__item',
					progressBar: '.u-progress-bar-v1',
					remove: '.js-result-list-item-remove'
				},
				itemAppendToEnd: false,
				removeConfirmation: true
			},
			uploadFile: {
				
			}
		},

		/**
		 *
		 *
		 * @var jQuery pageCollection
		 */
		pageCollection: $(),

		/**
		 * Initialization of File attachment wrapper.
		 *
		 * @param String selector (optional)
		 * @param Object config (optional)
		 *
		 * @return jQuery pageCollection - collection of initialized items.
		 */

		init: function(selector, config) {
			if (!selector) return;

			var $collection = $(selector);

			if (!$collection.length) return;

			config = config && $.isPlainObject(config) ? $.extend(true, {}, this._baseConfig, config) : this._baseConfig;

			this.initFileAttachment(selector, config);
		},

		initFileAttachment: function(el, conf) {
			//Variables
			var $el = $(el);

			//Actions
			$el.each(function() {
				var $this = $(this);

				$this.filer($.extend(true, {}, conf, {
					dragDrop: {}
				}));
			});
		}
	};
})(jQuery);
