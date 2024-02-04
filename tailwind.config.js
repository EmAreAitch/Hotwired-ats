module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.html.haml',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  mode: 'jit',
  plugins: [
    require('@tailwindcss/forms'),
  ],
  safelist: [
    'border-red-500',
    'focus:border-red-600',
    'focus:ring-red-600',
    'text-red-500',
  ]
}
