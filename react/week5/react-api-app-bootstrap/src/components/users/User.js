import React from "react";
import { Link } from "react-router-dom";

const User = props => {
  const { user } = props;
  return (
    <div className="col-md-4">
      <div className="card mb-4 shadow-sm">
        <div className="card-body">
          {/* <h3>{user.login}</h3> */}
          <p className="card-text">
            <strong>
              <i className="fas fa-user"> </i> User: {user.login}
            </strong>
            <strong>
              <img src={user.avatar_url} alt='User Avatar' className='img-thumbnail'/>
            </strong>
            <strong>
              <Link to={`users/${user.login}`} className='btn btn-dark btn-block'>
                <i></i> View User
              </Link>
            </strong>
          </p>
        </div>
      </div>
    </div>
  );
};

export default User;
