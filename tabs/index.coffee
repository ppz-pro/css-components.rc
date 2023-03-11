import React from 'react'
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
  <>
    <nav className='ppz-ccs tabs'>
      {list.map((t,i) =>
        <label className='ppz-ccs tab' key={i}>
          <span>{t.name}</span>
          <input type='radio' name={name} defaultChecked={i===defaultChecked} />
        </label>
      )}
    </nav>
    <div className='ppz-ccs tabs'>
      {list.map((t) => t.el)}
    </div>
  </>

export Tab = (props) -> pug"""
  section.ppz-ccs.tab(...props)
"""
