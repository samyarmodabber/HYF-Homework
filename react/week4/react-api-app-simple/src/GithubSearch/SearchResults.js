import React, { Component } from "react";

export default class SearchResults extends Component {
  renderUsers = items => {
    // const { items } = this.props; //It did not work here.WHY?
    return items.map(item => {
      return (<li key={item.id}>{item.login} URL: {item.url}</li> );
    });
  };

  render() {
    const { items, loadStatus } = this.props;
    if (items) {
      console.log(loadStatus);
      return <ul>{this.renderUsers(items)}</ul>;
    } else if (!items) {
      return <p>No data</p>;
    } else {
      return <p>Error</p>;
    }
  }
}
