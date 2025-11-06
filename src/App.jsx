import { useEffect, useRef } from 'react';
import './App.css';
import Sketch from './app.js';

function App() {
  const canvasRef = useRef(null);

  useEffect(() => {
    if (canvasRef.current) {
      const sketch = new Sketch({
        dom: canvasRef.current
      });

      return () => {
        sketch.stop();
      };
    }
  }, []);

  return (
    <div id="container" ref={canvasRef}></div>
  );
}

export default App;
