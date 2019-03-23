import React from "react";
import Users from "../users/Users";
import Search from "../users/Search";

const Index = () => {
  return (
    <React.Fragment>
      <Search/>
      <Users />
    </React.Fragment>
  );
};

export default Index;
