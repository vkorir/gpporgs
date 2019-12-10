import {MatSnackBar} from '@angular/material';

let serverUrl = window.location.origin;
if (process.env.NODE_ENV === 'development') {
  serverUrl = 'http://localhost:8080';
}
export default serverUrl;
