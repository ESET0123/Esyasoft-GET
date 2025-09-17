function EventComponent(){
    const onChangeHandler=(e)=>{
        console.log(e.target.value);
        
    }
    const onChangeHandler2=(e)=>{
        let txt = e.target.value;
        if(txt === "Rishav")
            console.log("Yes");
    }

    return(
        <>
            Welcome to events
            <br/>
            <button onClick={()=>(console.log("button clicked"))}>Click me</button>
            <div style={{ backgroundColor: 'blue', padding: '50px' }} onMouseEnter={()=>(console.log("Mouse entered the div"))}>
                This is div
            </div>
            Number Input:<input type="number" min={1} max={10} ></input><br/>
            Text Input:<input type="text"  onChange={onChangeHandler}></input>
            String Input:<input type="text"  onChange={onChangeHandler2}></input>
        </>
    )
}

export default EventComponent