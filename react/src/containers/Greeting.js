import React, { Component } from 'react';

class Greeting extends Component {
  constructor(props) {
    super(props);
    this.state = {}
  }

  render () {

    return(
      <div>
        <h1>Hello and Welcome to the Barber Shop!</h1>
      </div>
    )
  }
}

export default Greeting;
