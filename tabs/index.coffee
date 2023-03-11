import React from 'react'
import $ from 'utils.rc/$'
import '@ppzp/css-components/tabs.css'

uniqueName = 1
export Tabs = ({ list, children, defaultChecked = 0 }) ->
  # 可以传入 defaultChecked = null，用来表示谁也不选
  if children?.length
    list = list.map (name, index) ->
      {
        name
        el: children[index]
      }
  name = 'ppz-tabs-' + uniqueName++

  $(React.Fragment,
    $.nav({ className: 'ppz-ccs tabs' },
      list.map((t,i) =>
        $.label({ className: 'ppz-ccs tab', key: i },
          $.span(t.name),
          $.input({ type: 'radio', name, defaultChecked: i==defaultChecked })
        )
      )
    ),
    $.div({ className: 'ppz-ccs tabs' },
      list.map((t,i) =>
        $(React.Fragment, { key: i }, t.el)
      )
    )
  )

export Tab = ({ className, ...props }) ->
  $.section {
    className: 'ppz-ccs tab ' + className
    ...props
  }
