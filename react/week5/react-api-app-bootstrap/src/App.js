import React, { Component } from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import "./App.css";

import {Provider} from "./context";

import Navbar from "./components/layouts/Navbar";
import Index from "./components/layouts/Index";
import Githubs from "./components/users/Githubs";


class App extends Component {
  render() {
    return (
      <Provider>
        <Router>
          <React.Fragment>
            <Navbar />
            <div className="container">
              <Switch>
                <Route exact path="/" component={Index} />
                <Route exact path="/users/:id" component={Githubs} />
                {/* We will use this id in Githubs component as params */}
              </Switch>
            </div>
          </React.Fragment>
        </Router>
      </Provider>
    );
  }
}

export default App;
