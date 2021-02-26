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

import {Application} from "stimulus"
import {definitionsFromContext} from "stimulus/webpack-helpers"

const application = Application.start();

// requires all of the controllers in the app/components directory.
const componentContext = require.context("../../components/", true, /(.*)\/.+\.js$/);
application.load(definitionsFromContext(componentContext));

import "controllers"
