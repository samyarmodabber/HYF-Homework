import React, { Component } from "react";

export default class SearchBox extends Component {
  render() {
    const { searchTerm, changeHandler, searchHandler } = this.props;
    return(
        <div>
            <input
                type='text'
                onChange={changeHandler}
                value={searchTerm}
            />
            {/* <button
                onClick={searchHandler}
            >
                SEARCH 
            </button> */}
        </div>
    ) 
  }
}
