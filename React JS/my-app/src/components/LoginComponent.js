import {useState} from 'react'

function LoginButton(){

    const [username, setUsername]= useState("");
    const [password, setPassword]= useState("");

    const onLoginHandler =()=>{
        if(username !== "username"){
            console.log({username});
            
            alert('invalid username')
            return;
        }
        if(password !== "password"){
            alert('invalid password')
            return;
        }
        alert("login successful")
        // alert("Login button clicked")
        // prompt("Give input")
    }

    return(
        <>
            <input type = "text" value={username} onChange={(e)=>(setUsername(e.target.value))} placeholder = "Username"/>
            <input type = "password" value={password} onChange={(e)=>(setPassword(e.target.value))} placeholder = "Password"/>
            <button onClick={onLoginHandler}>Login</button>
        </>
    )
}

export default LoginButton