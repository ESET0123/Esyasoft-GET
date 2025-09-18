import {useState} from 'react'

function LoginButton(){

    const [username, setUsername]= useState("");
    const [password, setPassword]= useState("");

        // Another way yo this same thing
    const [loginState, setLoginState]= useState({
        username: "", 
        password: ""
    });

    // const onUsernameChange =(e)=>{
    //     setLoginState({
    //         ...loginState,
    //         username: e.target.value
    //      }
    //     )
    // }
    // const onPasswordChange =(e)=>{
    //     setLoginState({...loginState,
    //         password:e.target.value
//          }
    //     )
    // }


    const onLoginHandler =(e)=>{
        e.preventDefault();
        if(username !== "username"){
            console.log({e});
            
            // alert('invalid username')
            return;
        }
        if(password !== "password"){
            // alert('invalid password')
            return;
        }
        // alert("login successful")
        // alert("Login button clicked")
        // prompt("Give input")

    
    }
    const onResetHandler =()=>{
        setUsername("");
        setPassword("");
    }

    return(
        <>
            <input type = "text" value={username} onChange={(e)=>(setUsername(e.target.value))} placeholder = "Username"/>
            <input type = "password" value={password} onChange={(e)=>(setPassword(e.target.value))} placeholder = "Password"/>
            <button onClick={onLoginHandler}>Login</button>

            <form onSubmit={onLoginHandler} onReset={onResetHandler}>
                <input type = "text" value={username} onChange={(e)=>(setUsername(e.target.value))} placeholder = "Username"/>
                <input type = "password" value={password} onChange={(e)=>(setPassword(e.target.value))} placeholder = "Password"/>
                <button type = "submit" >Login</button>
                <button type = "reset" >Reset</button>
            </form>
        </>
    )
}

export default LoginButton