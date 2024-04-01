const reloadcss = function() {
  // main scss file
  const scss = `${App.configDir}/style/bar.scss`

  // target css file
  const css = `/tmp/my-style.css`

  // compile, reset, apply
  Utils.exec(`sass ${scss} ${css}`)
  App.resetCss()
  App.applyCss(css)
}
reloadcss()

Utils.monitorFile(`${App.configDir}/style`, reloadcss)

const date = Variable('', {
  poll: [1000, `date "+%A the %e of %B at %H:%M"`, (out) => {
    /**
      * @param { string } suffix
      */
    const refinedDate = function addDateNumberSuffix(suffix) {
      const [_, date] = out.match(/^.*?(\d{1,2}).*$/) ?? []
      const splitDate = out.split('')
      splitDate.splice(out.indexOf(date) + date.length, 0, suffix)
      return splitDate.join('')
    }

    switch (true) {
      case ['1', '21', '31'].includes(out): return refinedDate('st')
      case ['2', '22'].includes(out): return refinedDate('nd')
      case ['3', '23'].includes(out): return refinedDate('rd')
      default: return refinedDate('th')
    }
  }]
})

const Bar = (monitor = 0) => {
  return Widget.Window({
    monitor,
    className: 'bar',
    name: `bar${monitor}`,
    anchor: ['top', 'left', 'right'],
    child: Widget.Label({ label: date.bind() })
  })
}

export default {
  window: [
    Bar(0)
  ]
}
