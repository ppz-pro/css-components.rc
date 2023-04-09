import React from 'react'
import { $ } from '@ppzp/utils.rc'
import '@ppzp/css-components/tabs.css'

getUniqueName = do ->
  index = 0
  return ->
    'ppz-tabs-' + ++index

###
1. list: ['tab1', 'tab2', ...], children: [el1, el2, ...]
2. list: [{ name: 'tab1', el: el1 }, { name: 'tab2', el: el2 }, ...], children: null
###
export useTabs = ({ list, children, defaultChecked = 0 }) ->
  # 可以传入 defaultChecked = null，用来表示谁也不选
  [checked, setChecked] = React.useState defaultChecked

  if children?.length
    list = list.map (name, index) ->
      {
        name
        el: children[index]
      }
  name = getUniqueName()

  return {
    checked
    setChecked
    el: $(React.Fragment,
      $.nav({ className: 'ppz-ccs tabs' },
        list.map((t,i) =>
          $.label({ className: 'ppz-ccs tab', key: i },
            $.span(t.name),
            $.input({
              name
              type: 'radio'
              checked: i == checked
              onClick: -> setChecked(i)
            })
          )
        )
      ),
      $.div({ className: 'ppz-ccs tabs' },
        list.map((t,i) =>
          $(React.Fragment, { key: i }, t.el)
        )
      )
    )
  }

export Tab = ({ className, ...props }) ->
  $.section {
    className: 'ppz-ccs tab ' + className
    ...props
  }
