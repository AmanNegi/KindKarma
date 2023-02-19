import React, { useState } from "react";

export default function SignUp() { 
  const [inputValue, setInputValue] = useState(""); 
  const handleInputChange = (e) => { 
    setInputValue(e.target.value) 
  } 
  const handleSubmitButton = () => { 
    alert(inputValue); 
  }; 
  return ( 
    <div className="App"> 
      <input value={inputValue} onChange={handleInputChange} /> 
      <input type="submit" value="submit" onClick={handleSubmitButton} /> 
    </div> 
  ); 
}
