import React, { Component } from "react";
import SearchBox from "./SearchBox";
import SearchResults from "./SearchResults";
import { searchUser } from "./searchGithubAPI";
// import {testUser} from './SearchGithubAPI';

export default class GithubSearch extends Component {
  state = {
    items: null,
    loadStatus: "isLoading",
    inputText: ""
  };
  changeHandler = e => {
    this.setState({ inputText: e.target.value }, () => {
      this.searchHandler();
    });
  };
  searchHandler = () => {
    searchUser(this.state.inputText)
      .then(res => this.setState({ items: res.items, loadStatus: "loaded" }))
      .catch(err => this.setState({ loadstatus: "error" }));
  };

  // componentDidMount(){
  //     searchUser('sam').then(res=>{
  //         this.setState({items:res.items,isLoaded:true})
  //     }).catch(err=>{
  //         console.log(err);
  //         this.setState({isLoaded:false})
  //     })
  // }

  render() {
    const { items, loadStatus, inputText } = this.state;
    console.log(loadStatus);
    
    return (
      <React.Fragment>
        <SearchBox
          searchTerm={inputText}
          changeHandler={this.changeHandler}
          searchHandler={this.searchHandler}
        />
        <SearchResults items={items} loadStatus={loadStatus} />
      </React.Fragment>
    );
  }
}
