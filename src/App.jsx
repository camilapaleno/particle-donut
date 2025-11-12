import { useEffect, useRef } from 'react';
import './App.css';
import Sketch from './app.js';

function App() {
  const canvasRef = useRef(null);
  const sketchRef = useRef(null);

  useEffect(() => {
    if (canvasRef.current && !sketchRef.current) {
      sketchRef.current = new Sketch({
        dom: canvasRef.current
      });
    }

    return () => {
      if (sketchRef.current) {
        sketchRef.current.stop();
      }
    };
  }, []);

  return (
    <div id="container" ref={canvasRef}></div>
  );
}

export default App;
