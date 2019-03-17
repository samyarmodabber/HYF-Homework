import React, { Component } from "react";
import axios from "axios";
import { Consumer } from "../../context";

class Search extends Component {
  state = {
    searchTerm: ""
  };
  onChange = e => {
    this.setState({ [e.target.name]: e.target.value });
    // it works for every input. {name} in input must be mach with parameter in STATE
  };
  findUser = (dispatch, e) => {
    e.preventDefault();
    axios
      .get(`https://api.github.com/search/users?q=${this.state.searchTerm}`)
      .then(res => {
        dispatch({
          type: "SEARCH_USERS",
          payload: res.data.items
        });
        this.setState({searchTerm:''})
        console.log(res.data.items);
        console.log(this.state);
      })
      .catch(err => console.log("Error: " + err));
  };
  render() {
    return (
      <Consumer>
        {value => {
          // console.log(value);
          const { dispatch } = value;

          return (
            <div className="card card-body m-4 p-4">
              <h1 className="display-4 text-center">
                Search for a Github User
              </h1>
              <form onSubmit={this.findUser.bind(this, dispatch)}>
                <div className="form-group">
                  <input
                    className="form-control form-lg"
                    placeholder="Search for a user ..."
                    value={this.state.searchItem}
                    name="searchTerm"
                    onChange={this.onChange}
                  />
                </div>
                <button
                  className="btn btn-dark btn-block m-2 btn-lg"
                  type="submit"
                >
                  Search
                </button>
              </form>
            </div>
          );
        }}
      </Consumer>
    );
  }
}

export default Search;
