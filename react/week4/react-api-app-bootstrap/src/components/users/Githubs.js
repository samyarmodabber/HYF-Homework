import React, { Component } from "react";
import axios from "axios";
import Loader from "../layouts/Loader";
import { Link } from "react-router-dom";

class Githubs extends Component {
  state = {
    user: {}
  };
  componentDidMount() {
    //   console.log(this.props.match.params);
    axios
      .get(`https://api.github.com/users/${this.props.match.params.id}`)
      .then(res => {
        this.setState({ user: res.data });
        console.log(this.state.user);
      })
      .catch(err => console.log("Error: " + err));
  }
  render() {
    const { user } = this.state;
    if (user === undefined || Object.keys(user).length === 0) {
      return <Loader />;
    } else {
      return (
        <React.Fragment>
          <Link to="/" className="btn btn-dark btn-sm-4 mb-4">
            Go Back Home
          </Link>
          <div className="card">
            <img src={user.avatar_url} alt='User Avatar' className='img-rounded mx-auto d-block '/>
            <h4 className="card-header">{user.login}</h4>
            <div className='card-body'>
                <ul className='list-group mt-2'>
                    <li className='list-group-item'>ID: {user.id}</li>
                    <li className='list-group-item'>Type: {user.type}</li>
                    <li className='list-group-item'><a href={`https://github.com/${user.login}`}>Go to Github page</a></li>

                </ul>
            </div>
          </div>
        </React.Fragment>
      );
    }
  }
}

export default Githubs;
