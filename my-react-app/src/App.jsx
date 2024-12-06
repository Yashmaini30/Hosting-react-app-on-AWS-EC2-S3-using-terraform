import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div className='bg-red-500 justify-center items-center h-screen text-white'>
        <div className='flex flex-col justify-center items-center h-screen'>
        <div className='text-3xl font-bold flex items-center justify-center'>Hello World </div>
        <div className='text-blue-50 '>
          <div className=' font-semibold m-3 p-2 border-2 border-spacing-5 border-black mt-5 mb-5'><button onClick={() => setCount(count + 1)}>Click </button></div>
          <div> count : {count}</div>
        </div>
        </div>
      </div>
    </>
  )
}

export default App
