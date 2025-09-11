function Counter() {
    var x='a';
    console.log(x);
    var x=5;
    console.log(x);
    if (true) {
        var a = 1;
        let b = 2;
        const c = 3;
    }
    console.log(a);
    // console.log(b);

    const add = (a,b) => a+b;   // implicit arrow function
    console.log(add(9,8));

    
    const user={
        name:'Rishav',
        info: {
            city:'Kolkata'
        }
    }
    
    const {name: username='Aron', info:{city}={}}=user;
    console.log(username);
    console.log(city);

    let F=7, G=2;
    [F,G]= [G,F];

    console.log(F);
    console.log(G);

    const prev ={name: 'A', age:20}
    const next = {...prev, game:'Football'}
    console.log(next.name);
    console.log(next.age);
    console.log(next.game);
    
    
    

    let count=0;
    const increment=()=>{
        count++;
        document.getElementById("c1").innerText=count;
    }

    
    return (
        <>
        <h1 id="c1">0</h1>
        <button onClick={increment}>Increament</button>
        </>
    )
}

export default Counter