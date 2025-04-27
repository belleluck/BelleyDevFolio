import React, { useState, useEffect } from 'react';

import logo from './logo.svg';
import './App.css';

function App() {
  // return (
  //   <div className="App">
  //     <header className="App-header">
  //       <img src={logo} className="App-logo" alt="logo" />
  //       <p>
  //         Edit <code>src/App.js</code> and save to reload.
  //       </p>
  //       <a
  //         className="App-link"
  //         href="https://reactjs.org"
  //         target="_blank"
  //         rel="noopener noreferrer"
  //       >
  //         Learn React
  //       </a>
  //     </header>
  //   </div>
  // );

  const [projects, setProjects] = useState([]);

  useEffect(() => {
    fetch('https://your-api.onrender.com/admin/projects', {
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      }
    })
      .then(res => res.json())
      .then(data => setProjects(data));
  }, []);

  return (
    <div className="App">
      <h2>Admin Console</h2>
      {projects.map(p => <div key={p.id}>{p.title}</div>)}
    </div>
  );
}

export default App;
