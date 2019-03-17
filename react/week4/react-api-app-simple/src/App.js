import React, { Component } from 'react';
import './App.css';
import GithubSearch from './GithubSearch'

class App extends Component {
  render() {
    return (
      <React.Fragment>
        <h1> Serch Github</h1>
        <GithubSearch/>
      </React.Fragment>
    );
  }
}

export default App;
