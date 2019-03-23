import React, { Component } from "react";
import axios from "axios";

const Context = React.createContext();
const reducer = (state, action) => {
  switch (action.type) {
    case "SEARCH_USERS":
      return {
        ...state,
        user_list: action.payload,
        heading: "Search Results"
      };
    default:
      return state;
  }
};
export class Provider extends Component {
  state = {
    user_list: [],
    heading: "Random Users",
    dispatch: action => this.setState(state => reducer(state, action))
  };
  componentDidMount() {
    axios
      .get(
        `https://api.github.com/search/users?q=sam+repos:%3E42+followers:%3E1000`
      )
      .then(res => {
        this.setState({ user_list: res.data.items });
        //   console.log(res);
      })
      .catch(err => console.log("Error: " + err));
  }
  render() {
    return (
      <Context.Provider value={this.state}>
        {this.props.children}
      </Context.Provider>
    );
  }
}

export const Consumer = Context.Consumer;
