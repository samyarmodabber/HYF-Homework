import React from "react";
import loaderImage from "./silhouette-solo-loader-dribbble_v2.gif";

const Loader = () => {
  return (
    <div>
      <img src={loaderImage} alt="Loadding data ..." style={{width:'300px', margin:'400 auto'}} />
    </div>
  );
};

export default Loader;
