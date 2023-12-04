import { useState } from "react"

const App = () => {
    const [count, setCount] = useState(5)
    return (
        <main>
            <button onClick={() => setCount(count +1)}>click me</button>
            <p>count = {count}</p>
            <p>hello world from a server</p>

        </main>
    )
}

export default App