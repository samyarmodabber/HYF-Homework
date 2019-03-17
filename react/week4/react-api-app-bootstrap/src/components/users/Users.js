import React, { Component } from "react";
import { Consumer } from "../../context";
import Loader from "../layouts/Loader";
import User from "../users/User";



class Users extends Component {
  render() {
    return (
      <Consumer>
        {value => {
          // console.log(value);
          const { user_list ,heading } = value;
          if (user_list === undefined || user_list.lenght === 0) {
            return <Loader />;
          } else {
            return (
              <React.Fragment>
                <h3 className="text-center mb-4">{heading}</h3>
                <div className='row'>
                  {
                    user_list.map(item=>
                      <User key={item.id} user={item}/>
                    )
                  }
                </div>
              </React.Fragment>
            );
          }
        }}
      </Consumer>
    );
  }
}

export default Users;
