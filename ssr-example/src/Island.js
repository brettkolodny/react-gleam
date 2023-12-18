import React from 'react'

const isServer = typeof window === `undefined`;
const  Island = ({
    children,
    componentName,
    islandTag: IslandComponent = 'div',
    ...islandProps
  }) => {
    let hydrationProps;
    if(isServer){
      hydrationProps = JSON.stringify(React.Children.only(children).props);
    }
    return (
      <IslandComponent
        data-tropical-hydration-component={componentName}
        data-tropical-hydration-props={hydrationProps}
        {...islandProps}
      >
        {children}
      </IslandComponent>
    )
  }

  export default Island