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

    $('.tokenize-recipe-categories').each(function (index) {
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
                        var new_object_id = json_data.id;
                        var option = object.find('option[value="' + value + '"]');
                        option.attr('value', new_object_id);
                        value = new_object_id;

                        width = 1200;
                        height = 400;
                        if (window.innerWidth)
                        {
                            var left = (window.innerWidth - width) / 2;
                            var top = (window.innerHeight - height) / 2;
                        }
                        else
                        {
                            var left = (document.body.clientWidth - width) / 2;
                            var top = (document.body.clientHeight - height) / 2;
                        }
                        window.open(url + '/' + new_object_id + '/edit', 'category_edit', 'menubar=no, scrollbars=no, top=' + top + ', left=' + left + ', width=' + width + ', height=' + height + '');
                    });
                }
                $.ajax({
                    type: "GET",
                    url: url + '/' + value,
                }).success(function (json_data) {
                    $('.suggested-categories').html('');
                    for (i = 0; i < json_data.suggested_categories_for_recipes.length; i++) {
                        var category = json_data.suggested_categories_for_recipes[i];
                        $('.suggested-categories').append(' <span class="label label-default" data_category_id="' + category.id + '">' + category.name + '</span>');
                    }
                });
            }
        });
    });

    $('.suggested-categories').on('click', 'span', function () {
        var span = $(this);
        var value = span.attr('data_category_id');
        var text = span.html();
//        var option = $('.tokenize-recipe-categories').find('option[value="' + span.attr('data_category_id') + '"]');
//        option.attr('selected', 'selected');
//        $('.tokenize-recipe-categories').data('tokenize').remap();
//        span.hide();
        $('.tokenize-recipe-categories').data('tokenize').tokenAdd(value, text, true);
        span.remove();
    });
});

