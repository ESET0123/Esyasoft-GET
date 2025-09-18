import React, {useState, useEffect } from "react"

const suggestionMaster=[
    "car",
    "case",
    "bike",
    "aeroplane"
];

export default function UseEffectComponent() {
    const [recommendation, setRecommendation]= useState(suggestionMaster);
    const [search, setSearch]= useState("");

    useEffect(()=>{
        // console.log("inside useEffect");
        setRecommendation(suggestionMaster.filter((e)=>e.includes(search)));
    },[search])
  return (
    <div>
        <input value={search} onChange={(e)=>setSearch(e.target.value)}/>
        {recommendation.map((element, index) => <div key={index}>{index}. {element}</div>)}
      
    </div>
  )
}
