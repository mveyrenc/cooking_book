// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("simplemde")
require("selectize")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// import {Turbo} from "@hotwired/turbo-rails"
// window.Turbo = Turbo

import {Application} from "stimulus"
import {definitionsFromContext} from "stimulus/webpack-helpers"

const application = Application.start();

// requires all of the controllers in the app/components directory.
const componentContext = require.context("../../components/", true, /(.*)\/.+\.js$/);
application.load(definitionsFromContext(componentContext));

import "controllers"
