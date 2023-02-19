import { BrowserRouter, Route,  Routes,Link} from 'react-router-dom';
import './app.css';

import Home from './components/home/Home';
import  SignUp  from  './components/SignUp/SignUp' ;
import logIn  from  './components/logIn/logIn' ;
import   volunteerlist from  './components/VolunterList/volunteerlist' ;

function App() {
  return (
    <div className="wrapper">
      <h1>KindKarma</h1>
    <BrowserRouter>
      <nav>
        <ul>
          <li><Link to="/Home">Home </Link></li>
          <li><Link to="/SignUp">SignUp</Link></li>
          <li><Link to="/logIn">logIn</Link></li>
          <li><Link to="/volunteerlist">volunteerlist</Link></li>
        </ul>
      </nav>

        <Routes>
        <Route path='/' element={<Home/>} />

        <Route path='/SignUp' element={<SignUp/>} />
        <Route path='/logIn' element={<logIn/>} />
        <Route path='/volunteerlist' element={<volunteerlist/>} />
        </Routes>
    </BrowserRouter>
    </div>
  );
}
export default App;