import { Fragment, useEffect, useState } from "react"

const CompactDiscs = () => {
    
    const [compactdiscsData, setCompactdiscsData] = useState([])

    const fetchCompactdiscsData = async () => {
        let data = [];

        const uri = `${location}compactdiscs`;
        const response = await fetch(uri);
        data = await response.json();
        console.log(data)
        setCompactdiscsData(data)
    }

    useEffect(() => {
        fetchCompactdiscsData()
    }, [])

    return (
        <>
            <h3>Compactdiscs</h3>
            <ul>
            {
                compactdiscsData.map((compactdisc) => {
                    return (
                            <Fragment key={compactdisc.title}>
                                <li>Title: {compactdisc.title}, Artist: {compactdisc.artist.name}</li>
                            </Fragment>
                    )
                })
  
            }
            </ul>
        </>
    )
}
export default CompactDiscs;
