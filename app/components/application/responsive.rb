module Application
  module Responsive
    BREAKPOINTS = {
      mobile: {
        class: 'is-mobile',
        suffix: '-mobile'
      },
      tablet: {
        class: 'is-tablet',
        suffix: '-tablet'
      },
      desktop: {
        class: 'is-desktop',
        suffix: '-desktop'
      },
      widescreen: {
        class: 'is-widescreen',
        suffix: '-widescreen'
      },
      fullhd: {
        class: 'is-fullhd',
        suffix: '-fullhd'
      }
    }.freeze

    DISPLAY = {
      block: { class: 'is-block' },
      flex: { class: 'is-flex' },
      inline: { class: 'is-inline' },
      inline_block: { class: 'is-inline-block' },
      inline_flex: { class: 'is-inline-flex' }
    }.freeze
  end
end
