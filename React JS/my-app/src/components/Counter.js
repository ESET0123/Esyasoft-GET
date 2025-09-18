import {useState} from "react"
function Counter(){
    const [counter, setCounter] = useState(0);
    const IncreamentButtonHandler =()=>{
        // setCounter(counter+1);       // use can use both
        setCounter(prev=>prev+1);
    }
    const DecreamentButtonHandler =()=>{
        setCounter(counter-1);
    }
    return(
        <>
            <div>{counter}</div>
            <button onClick={IncreamentButtonHandler}>Increament</button>
            <button onClick={DecreamentButtonHandler}>Decreament</button>
        </>
    );
}

export default Counter;