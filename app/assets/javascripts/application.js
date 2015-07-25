// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require_tree ./jquery_plugins
//= require bootstrap
//= require tinymce-jquery
//=require_self
//= require_tree .

$(document).ready(function () {
    $('.tokenize-category-categories').each(function (index) {
        var object = $(this);
        var url = object.attr("data_add_url");
        object.tokenize({
            onAddToken: function (value, text, e) {
                if (value === text) {
                    var object_data = {
                        category: {
                            name: value
                        }
                    };
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: object_data,
                        dataType: "json"
                    }).success(function (json_data) {
                        var option = object.find('option[value="' + value + '"]');
                        option.attr('value', json_data.id);
                    });
                }
            }
        });
    });
});

